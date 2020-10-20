Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2FF2936A0
	for <lists+nbd@lfdr.de>; Tue, 20 Oct 2020 10:18:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 32CF1205E9; Tue, 20 Oct 2020 08:18:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 20 08:18:18 2020
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C842E205E2
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Oct 2020 08:18:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8qZIcOwvYSJA for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Oct 2020 08:18:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 3F30D205DD
	for <nbd@other.debian.org>; Tue, 20 Oct 2020 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603181881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
	bh=+NDRN1egFUf+3Gupcs3ezBLr6XEOFAxaXme8LXJmSwc=;
	b=Wf/W9xqfo+tMwpQ0GoThl0imgRt3iVol01EgNeD0XAyNkhbkr/OwjLlK7DvqhiFgD4f5RK
	tMK7Ra9zovxsgW8YmbUbTzfo/yYVWCO8FzfwyAqKm/3mh2uVx3Qz6vlFiQdsjZiiwfrPxK
	a+D5/Rh1fCeSXWxJjqFjTMq84zGgWFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-qVbfwBTpOpO_DoRrUsMNUw-1; Tue, 20 Oct 2020 04:16:35 -0400
X-MC-Unique: qVbfwBTpOpO_DoRrUsMNUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3463C1006C8C;
	Tue, 20 Oct 2020 08:16:34 +0000 (UTC)
Received: from lxbceph1.gsslab.pek2.redhat.com (vm37-120.gsslab.pek2.redhat.com [10.72.37.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF0B15D9D2;
	Tue, 20 Oct 2020 08:16:31 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: nbd@other.debian.org,
	linux-block@vger.kernel.org,
	jdillama@redhat.com,
	mgolub@suse.de,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH 2/2] nbd: fix double lock for nbd->config_lock
Date: Tue, 20 Oct 2020 04:16:15 -0400
Message-Id: <20201020081615.240305-3-xiubli@redhat.com>
In-Reply-To: <20201020081615.240305-1-xiubli@redhat.com>
References: <20201020081615.240305-1-xiubli@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Yh7XCtF7qXP.A.vpE.K1pjfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1019
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201020081615.240305-3-xiubli@redhat.com
Resent-Date: Tue, 20 Oct 2020 08:18:18 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

When NBD_CLEAR_SOCK with ioctl method, it will double lock the
config_lock.

Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 drivers/block/nbd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 3d3f4255e495..b21abf134e34 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1358,9 +1358,7 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 	sock_shutdown(nbd);
 	__invalidate_device(bdev, true);
 	nbd_bdev_reset(bdev);
-	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
-			       &nbd->config->runtime_flags))
-		nbd_config_put(nbd);
+	nbd_config_clear_rt_ref_and_put(nbd);
 }
 
 static bool nbd_is_valid_blksize(unsigned long blksize)
-- 
2.18.4

