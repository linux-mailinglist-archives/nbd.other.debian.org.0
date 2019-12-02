Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14F10F2B8
	for <lists+nbd@lfdr.de>; Mon,  2 Dec 2019 23:15:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4E85D20615; Mon,  2 Dec 2019 22:15:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec  2 22:15:08 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7AC862067B
	for <lists-other-nbd@bendel.debian.org>; Mon,  2 Dec 2019 21:58:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jK59TzBP-8wZ for <lists-other-nbd@bendel.debian.org>;
	Mon,  2 Dec 2019 21:58:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 376 seconds by postgrey-1.36 at bendel; Mon, 02 Dec 2019 21:58:24 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 8C9C120675
	for <nbd@other.debian.org>; Mon,  2 Dec 2019 21:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575323899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b0+29zshaUbRjfxHy1HWRGMyTGil9Zlb7of0bIH6jfk=;
	b=VD+eNzWd7Eu+b4iiuZnbIykFnjKV+lQbgSRSICV+R477Ig/qcJF+HpIX9wsMM5FpkGnOoY
	V3tkhCr7SXcb8RPyXZLp23D8k+MNBY86WwzlSagC/UhbxnVIaDqhxQUYvCusupfZcvNW5S
	8zxNbyGn8msc1Cav87TZRKcVH9Mvd+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17--qmsZSzkMcWcu3MRxu67lQ-1; Mon, 02 Dec 2019 16:51:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB74DB61;
	Mon,  2 Dec 2019 21:51:56 +0000 (UTC)
Received: from rh2.redhat.com (ovpn-126-161.rdu2.redhat.com [10.10.126.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73E6A19C68;
	Mon,  2 Dec 2019 21:51:52 +0000 (UTC)
From: Mike Christie <mchristi@redhat.com>
To: sunke32@huawei.com,
	nbd@other.debian.org,
	axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org
Cc: Mike Christie <mchristi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] nbd: fix shutdown and recv work deadlock
Date: Mon,  2 Dec 2019 15:51:50 -0600
Message-Id: <20191202215150.10250-1-mchristi@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -qmsZSzkMcWcu3MRxu67lQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0yaAou6RH3K.A.N4C.szY5dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/752
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191202215150.10250-1-mchristi@redhat.com
Resent-Date: Mon,  2 Dec 2019 22:15:08 +0000 (UTC)

This fixes a regression added with:

commit e9e006f5fcf2bab59149cb38a48a4817c1b538b4
Author: Mike Christie <mchristi@redhat.com>
Date:   Sun Aug 4 14:10:06 2019 -0500

    nbd: fix max number of supported devs

where we can deadlock during device shutdown. The problem will occur if
userpsace has done a NBD_CLEAR_SOCK call, then does close() before the
recv_work work has done its nbd_config_put() call. If recv_work does the
last call then it will do destroy_workqueue which will then be stuck
waiting for the work we are running from.

This fixes the issue by having nbd_start_device_ioctl flush the work
queue on both the failure and success cases and has a refcount on the
nbd_device while it is flushing the work queue.

Cc: stable@vger.kernel.org
Signed-off-by: Mike Christie <mchristi@redhat.com>
---
 drivers/block/nbd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 57532465fb83..f8597d2fb365 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1293,13 +1293,15 @@ static int nbd_start_device_ioctl(struct nbd_device=
 *nbd, struct block_device *b
=20
 =09if (max_part)
 =09=09bdev->bd_invalidated =3D 1;
+
+=09refcount_inc(&nbd->config_refs);
 =09mutex_unlock(&nbd->config_lock);
 =09ret =3D wait_event_interruptible(config->recv_wq,
 =09=09=09=09=09 atomic_read(&config->recv_threads) =3D=3D 0);
-=09if (ret) {
+=09if (ret)
 =09=09sock_shutdown(nbd);
-=09=09flush_workqueue(nbd->recv_workq);
-=09}
+=09flush_workqueue(nbd->recv_workq);
+
 =09mutex_lock(&nbd->config_lock);
 =09nbd_bdev_reset(bdev);
 =09/* user requested, ignore socket errors */
@@ -1307,6 +1309,7 @@ static int nbd_start_device_ioctl(struct nbd_device *=
nbd, struct block_device *b
 =09=09ret =3D 0;
 =09if (test_bit(NBD_RT_TIMEDOUT, &config->runtime_flags))
 =09=09ret =3D -ETIMEDOUT;
+=09nbd_config_put(nbd);
 =09return ret;
 }
=20
--=20
2.20.1

