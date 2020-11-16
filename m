Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA52B48EE
	for <lists+nbd@lfdr.de>; Mon, 16 Nov 2020 16:16:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1991A20336; Mon, 16 Nov 2020 15:16:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 16 15:16:35 2020
Old-Return-Path: <BATV+29a21e8ca386e11a5a78+6294+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7C62420350
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Nov 2020 14:58:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.15 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id U3TY-V3rRj6r for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Nov 2020 14:58:46 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 91F4E20348
	for <nbd@other.debian.org>; Mon, 16 Nov 2020 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dr8Nr8dbB7J11PqXo+7/b7tximxSHcvF1HcCKGt1IiI=; b=TpTZ5F4/AmdsxM2Cu94cy7eEas
	3X7DT8n5Y9HTYUNPKGh1eqWOrzm0xYcV10TWm7qZ2DAYxl9FZdzB5TSQwbJco0DGEH8GHNaKj4/uO
	UapJemi5kTz7ILke6BFMPk1Qp+enisOjgnM5WI66jPW/Vmd0viYdg1qSGiqiQimTL89OKOdtd5INW
	I0maxo/xPZ0nKatsoAF7NrHgoNRWlnrSm1gKMxhQmVA8vJCsPu08PgWB0cu99api4IM/dOgYmUa59
	BLoaxWXKPrvz0+ejgB6cVN2tLjQDwxy7EgSet0pUC1cws2cyKk57iZ+SQrQfZqgWnLnZ1UKD1blpx
	ffC4VyOw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxK-0003iO-GD; Mon, 16 Nov 2020 14:58:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: cleanup updating the size of block devices v3
Date: Mon, 16 Nov 2020 15:56:51 +0100
Message-Id: <20201116145809.410558-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mBWtAetaK3K.A.y_E.TfpsfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1068
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201116145809.410558-1-hch@lst.de
Resent-Date: Mon, 16 Nov 2020 15:16:35 +0000 (UTC)

Hi Jens,

this series builds on top of the work that went into the last merge window,
and make sure we have a single coherent interfac for updating the size of a
block device.

Changes since v2:
 - rebased to the set_capacity_revalidate_and_notify in mainline
 - keep the loop_set_size function
 - fix two mixed up acks
 
Changes since v1:
 - minor spelling fixes

