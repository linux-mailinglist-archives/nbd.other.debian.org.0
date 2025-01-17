Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE6A14A8F
	for <lists+nbd@lfdr.de>; Fri, 17 Jan 2025 09:00:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CDF51208AB; Fri, 17 Jan 2025 08:00:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 17 08:00:10 2025
Old-Return-Path: <BATV+61d77501dfe03cdea103+7817+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 09D9B208BC
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jan 2025 07:44:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z1DbxCr0xU3z for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jan 2025 07:44:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 420FB20629
	for <nbd@other.debian.org>; Fri, 17 Jan 2025 07:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZbVYkJYrb61Wu580Ft3djKNeSj1im8n+pYtEAikpOC0=; b=4kocN+NRToqX7xNsoN8OhOoZK9
	4T+lyUH4yD+p+6JBj/iJLHSK5rQFlKM9U0qpf7NjBBJAemrEH2IRwP+MRpeWaYu69bMiysOJ7l5K9
	sJ4cnzXGJiU1qpZczQ6g7ZpcIOp54dDdlkE3cAxzjWe7gHx8TF/YQwPQ8NUP5QEYcryWyoV7YLdIY
	3Guk2qfhZ9lFuyjbOoN5Hdjl0MHOmpOrdWZEE+q9/Q3U+BWw369oCDeFqJy4ZeM3mjlBbrvju6rCD
	DakJEzIYtaMC4fdUFASZ8qv9/etP/0VbR54K0IjcL4WMIDeDBSSKJ1qe5S+3hcvgBzI2uRW1zdBVw
	SLMP0gmg==;
Received: from 2a02-8389-2341-5b80-41c4-d87f-051e-5808.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:41c4:d87f:51e:5808] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYh25-0000000HEBf-34Fd;
	Fri, 17 Jan 2025 07:44:46 +0000
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
Subject: annotate noio context
Date: Fri, 17 Jan 2025 08:44:06 +0100
Message-ID: <20250117074442.256705-1-hch@lst.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MQ1q1KovTaB.A.QQlC.K4ginB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3356
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250117074442.256705-1-hch@lst.de
Resent-Date: Fri, 17 Jan 2025 08:00:10 +0000 (UTC)

Hi all,

based on the reports from lockdep annotating q_usage_count it became
clear that we need to do noio allocations in a lot more place.  One
is when the block driver calls back into the file system as in the
loop driver, the other is anything done while a process has a queue
frozen.

