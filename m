Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF45A23DA2
	for <lists+nbd@lfdr.de>; Fri, 31 Jan 2025 13:21:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8607B2112A; Fri, 31 Jan 2025 12:21:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 31 12:21:09 2025
Old-Return-Path: <BATV+2eee22e26c92f86f97cc+7831+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 673CA21100
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 Jan 2025 12:04:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id K5NXXO7IAAVE for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 Jan 2025 12:04:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EA83821083
	for <nbd@other.debian.org>; Fri, 31 Jan 2025 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=toZkHOKmtEQt0GILvsU2MdLlyWFdCCeeIMu36shQMpg=; b=xNANpsRDy4fiZw8pcI16S3+fpM
	6U6jX0NI7J3vpA0NhfR9ZB6QjLTDTL+60gmHAQXSw44p2lbIGrbNxOH1GsYyhOVeEBl5THc0v0YGa
	rGJSw0oFI3veIC2GXzZiyDDJchZR30izNN6JL8nkbFly4ZG28B5vy+6dAg21iaRtDgsADrh94Hwn0
	aWDy6DV85yVPjjIM4hdKVfMin0MCT7ILFQEL8LQdWELNswPQ5+bhpRxw1SGdvSPv8lJsNjP6gXsX9
	OC+IAuP069jTa5MiQi3OtPd4A3QIKtX5Ymn1QfVYvzsX1GCiZVkrvHtdT/t+VlTo94A240kjY4PP5
	L3apPL2Q==;
Received: from 2a02-8389-2341-5b80-85a0-dd45-e939-a129.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:85a0:dd45:e939:a129] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpkY-0000000AZLj-3pum;
	Fri, 31 Jan 2025 12:03:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: annotate noio context v2
Date: Fri, 31 Jan 2025 13:03:46 +0100
Message-ID: <20250131120352.1315351-1-hch@lst.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y74kqQ0UGjC.A.njGP.1AMnnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3362
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250131120352.1315351-1-hch@lst.de
Resent-Date: Fri, 31 Jan 2025 12:21:09 +0000 (UTC)

Hi all,

based on the reports from lockdep annotating q_usage_count it became
clear that we need to do noio allocations in a lot more place.  This
patch takes care of ensuring allocations with a frozen queue are
done using the noio flag to avoid deadlocks.

Changes since v1:
 - drop the loop patch that isn't needed

