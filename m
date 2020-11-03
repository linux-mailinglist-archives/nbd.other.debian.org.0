Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C94112A3AE4
	for <lists+nbd@lfdr.de>; Tue,  3 Nov 2020 04:15:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8D77120660; Tue,  3 Nov 2020 03:15:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  3 03:15:03 2020
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 04F302063C
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Nov 2020 03:14:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id soQ22ASo5EgK for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Nov 2020 03:14:51 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 377 seconds by postgrey-1.36 at bendel; Tue, 03 Nov 2020 03:14:51 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by bendel.debian.org (Postfix) with ESMTP id 3AFCF20637
	for <nbd@other.debian.org>; Tue,  3 Nov 2020 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604373286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
	bh=7d8NLKQ39hOXdWATpr3kMEgdUtKNQ0LPQV//tVnVdDw=;
	b=Ajjy+3lrwNyNmMZkBAufTeEVDyxy/3rQVrilza6fgyk0FNeL3skJC4bJ00dR/oXgyNAj/6
	r6qg0DW6zpsiHfqqAfsGF+ieLwF8VgG7veJzPaD6x61f1Kk24VT6OrbKngj7iwS+cvp4Mv
	gKAyu36NfifRfth/kAjFycPL0LBOBsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-D1O5DemgO5eH4TqFoRx-9A-1; Mon, 02 Nov 2020 22:08:24 -0500
X-MC-Unique: D1O5DemgO5eH4TqFoRx-9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1320B1868406;
	Tue,  3 Nov 2020 03:08:23 +0000 (UTC)
Received: from lxbceph1.gsslab.pek2.redhat.com (vm37-120.gsslab.pek2.redhat.com [10.72.37.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 738BA5576E;
	Tue,  3 Nov 2020 03:08:20 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	ming.lei@redhat.com
Cc: nbd@other.debian.org,
	linux-block@vger.kernel.org,
	jdillama@redhat.com,
	mgolub@suse.de,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH v2 2/2] nbd: add comments about double lock for config_lock confusion
Date: Mon,  2 Nov 2020 22:07:58 -0500
Message-Id: <20201103030758.317781-3-xiubli@redhat.com>
In-Reply-To: <20201103030758.317781-1-xiubli@redhat.com>
References: <20201103030758.317781-1-xiubli@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TlYvNoisvGE.A.6XC.3sMofB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1029
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201103030758.317781-3-xiubli@redhat.com
Resent-Date: Tue,  3 Nov 2020 03:15:03 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

When calling the ioctl(), fget() will be called on this fd, and
nbd_release() is only called when the fd's refcount drops to zero.
With this we can make sure that the nbd_release() won't be called
before the ioctl() finished.

So there won't have the double lock issue for the "config_lock",
which has already been held by nbd_ioctl().

Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 drivers/block/nbd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 3bb8281bb753..48f36b003bf5 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1345,6 +1345,17 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 	sock_shutdown(nbd);
 	__invalidate_device(bdev, true);
 	nbd_bdev_reset(bdev);
+
+	/*
+	 * When calling the ioctl(), fget() will be called on this
+	 * fd, and nbd_release() is only called when the fd's refcount
+	 * drops to zero. With this we can make sure that the
+	 * nbd_release() won't be called before the ioctl() finished.
+	 *
+	 * So there won't have the double lock issue if it will
+	 * call the nbd_config_put() here for the "config_lock", which
+	 * has already been held by nbd_ioctl().
+	 */
 	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
 			       &nbd->config->runtime_flags))
 		nbd_config_put(nbd);
-- 
2.18.4

