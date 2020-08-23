Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3187024EC6F
	for <lists+nbd@lfdr.de>; Sun, 23 Aug 2020 11:27:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1FE352054B; Sun, 23 Aug 2020 09:27:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug 23 09:27:31 2020
Old-Return-Path: <BATV+5099a71ab767ecd89312+6209+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6DDC12052F
	for <lists-other-nbd@bendel.debian.org>; Sun, 23 Aug 2020 09:11:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.948 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.048]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RCcV9idgb0Xa for <lists-other-nbd@bendel.debian.org>;
	Sun, 23 Aug 2020 09:11:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C381F20535
	for <nbd@other.debian.org>; Sun, 23 Aug 2020 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=No1/zNvYiAlQJ+2VM2KxEVKX9my3nDvRhpc7oRbGQdM=; b=j1K8V7plEOJeLPtvyxOs4Di0MB
	K/7b31MHvupcxYapWHKr1a0hx0nGDI6xZzN3XPcorEnvGv+Zd2hvS+dCLU05yaqKrDDzeFTm/4DtO
	upJ2qqAS7pLLSDzPsXlNqdj7D7Pc2xnMJCelkfwXxsJS21cH28KDhnBzkZGZGSwUwyHELrP7eZ6KM
	XOhkPG5Ftewq53mD+aBu0fTnMQD92wLWJFth+fzWO/WjGpN2OvwA8bBehgXFghsezlndydOr9WziI
	0j7oIrogrtZKa145H/tfv5KlcfSijH1M0kuxuZKyAyvozqf7s3ukgjpNbDng+n1qyEzvWz+45tV7+
	Ot/nIsDQ==;
Received: from 171.168.43.195.cust.ip.kpnqwest.it ([195.43.168.171] helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9m1U-0003KT-Cw; Sun, 23 Aug 2020 09:10:44 +0000
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
Subject: fix block device size update serialization v2
Date: Sun, 23 Aug 2020 11:10:40 +0200
Message-Id: <20200823091043.2600261-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <L2d_d7ld2SL.A.QLE.DajQfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/945
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200823091043.2600261-1-hch@lst.de
Resent-Date: Sun, 23 Aug 2020 09:27:31 +0000 (UTC)

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

Changes since v1:
 - don't call __invalidate_device under the new spinlock
 - don't call into the file system code from the nvme removal code

