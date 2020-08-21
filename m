Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C324D198
	for <lists+nbd@lfdr.de>; Fri, 21 Aug 2020 11:36:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F64F20A67; Fri, 21 Aug 2020 09:36:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 21 09:36:36 2020
Old-Return-Path: <BATV+a718def99972ac67df6e+6207+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4146020A5F
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Aug 2020 09:21:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.948 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.048]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JZnoqEEZ0pu1 for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Aug 2020 09:21:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B061820A5E
	for <nbd@other.debian.org>; Fri, 21 Aug 2020 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EVl8E61DXgRR1ZNIk2YxGikvQ2O1Ac8Y751dPUZf5kA=; b=Mahqk11P0dtVI6WvpVZ3wbPfd6
	TOLmouapre5P0kVTzEU3HqwZFByZlxCfsG6R4LCAQEde65aGjIHnOELkSeXiwBiVLsCgnaiFc5MSt
	bvGYyrZ9NusMwXnv+hlzhDJ+I4OVdlWF/WhR7di5/YwH+8C/4tFLNJRZdH9NKDu3+jfaCADVNAeGN
	ktm0Qw0jD8zXP93Qm5deyNsGMKjxkuKyjwIUIvulughoawMKj7P036hpaE1C8BhnQ1KNpjW7ltyqz
	UB5eZs1ummTyPWBBdfzQmKKtQe7CWVkU7RMOrEnMA4elIOFazI/1fyVNV75dx+bpdv3LTg5BtDuoO
	VVT7V/RQ==;
Received: from [2001:4bb8:198:f3b2:a2b:85ba:fb78:c253] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k92qE-0007el-7k; Fri, 21 Aug 2020 08:56:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Xianting Tian <xianting_tian@126.com>,
	linux-block@vger.kernel.org,
	dm-devel@redhat.com,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: fix block device size update serialization
Date: Fri, 21 Aug 2020 10:55:58 +0200
Message-Id: <20200821085600.2395666-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <t3UoiG1AxpI.A.aVH.kW5PfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/940
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200821085600.2395666-1-hch@lst.de
Resent-Date: Fri, 21 Aug 2020 09:36:36 +0000 (UTC)

Hi Jens,

this series fixes how we update i_size for the block device inodes (and
thus the block device).  Different helpers use two different locks
(bd_mutex and i_rwsem) to protect the update, and it appears device
mapper uses yet another internal lock.  A lot of the drivers do the
update handcrafted in often crufty ways.  And in addition to that mess
it turns out that the "main" lock, bd_mutex is pretty dead lock prone
vs other spots in the block layer that acquire it during revalidation
operations, as reported by Xianting.

Fix all that by adding a dedicated spinlock just for the size updates.

