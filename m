Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BC73611640E
	for <lists+nbd@lfdr.de>; Mon,  9 Dec 2019 00:09:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A016204EF; Sun,  8 Dec 2019 23:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Dec  8 23:09:09 2019
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
	by bendel.debian.org (Postfix) with ESMTP id EE9FF204A9
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Dec 2019 22:52:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id akaT87poBhxl for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Dec 2019 22:52:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id C004920501
	for <nbd@other.debian.org>; Sun,  8 Dec 2019 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575845520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uxowTAVazvKFjO4M9Fa4G18zrvWzg1FDkS8+HQr9N4E=;
	b=SHLzW5Gegi8hM56AGLD0mySJhxkGZeSNDyENjAXsq304l5B4Ni6w1etCAtR8Ms1uRQ8yML
	45iyP0pgIoDMZrwX7mNQCTEOIqb1c3b4oVNYAn3UKDWDxRxmDq68HyDni2hv7yzRtzuWWQ
	9paJTsezfO9/igdvelBPoQTkAJcfNHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-zxUypHxhPRW5qQAZlAoKyg-1; Sun, 08 Dec 2019 17:51:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EA40107ACC4;
	Sun,  8 Dec 2019 22:51:54 +0000 (UTC)
Received: from rh2.redhat.com (ovpn-120-141.rdu2.redhat.com [10.10.120.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 000B319C5B;
	Sun,  8 Dec 2019 22:51:52 +0000 (UTC)
From: Mike Christie <mchristi@redhat.com>
To: sunke32@huawei.com,
	nbd@other.debian.org,
	axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org
Cc: Mike Christie <mchristi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] nbd: fix shutdown and recv work deadlock v2
Date: Sun,  8 Dec 2019 16:51:50 -0600
Message-Id: <20191208225150.5944-1-mchristi@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: zxUypHxhPRW5qQAZlAoKyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <E87KWPe-I9D.A.EpG.VKY7dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/756
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191208225150.5944-1-mchristi@redhat.com
Resent-Date: Sun,  8 Dec 2019 23:09:09 +0000 (UTC)

This fixes a regression added with:

commit e9e006f5fcf2bab59149cb38a48a4817c1b538b4
Author: Mike Christie <mchristi@redhat.com>
Date:   Sun Aug 4 14:10:06 2019 -0500

    nbd: fix max number of supported devs

where we can deadlock during device shutdown. The problem occurs if
the recv_work's nbd_config_put occurs after nbd_start_device_ioctl has
returned and the userspace app has droppped its reference via closing
the device and running nbd_release. The recv_work nbd_config_put call
would then drop the refcount to zero and try to destroy the config which
would try to do destroy_workqueue from the recv work.

This patch just has nbd_start_device_ioctl do a flush_workqueue when it
wakes so we know after the ioctl returns running works have exited. This
also fixes a possible race where we could try to reuse the device while
old recv_works are still running.

Cc: stable@vger.kernel.org
Signed-off-by: Mike Christie <mchristi@redhat.com>
---
v2:
- Drop the taking/dropping of a config_refs around the ioctl. This is
not needed because the caller has incremented the refcount already via
the open() call before doing the ioctl().

 drivers/block/nbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 57532465fb83..b4607dd96185 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1296,10 +1296,10 @@ static int nbd_start_device_ioctl(struct nbd_device=
 *nbd, struct block_device *b
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
--=20
2.20.1

