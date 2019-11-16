Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4E3FEAE3
	for <lists+nbd@lfdr.de>; Sat, 16 Nov 2019 07:06:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8250C20B47; Sat, 16 Nov 2019 06:06:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Nov 16 06:06:19 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0B65020B4B
	for <lists-other-nbd@bendel.debian.org>; Sat, 16 Nov 2019 05:50:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SFkfYPrAwq3u for <lists-other-nbd@bendel.debian.org>;
	Sat, 16 Nov 2019 05:50:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .redhat. - helo: .us-smtp-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id E74ED20B4C
	for <nbd@other.debian.org>; Sat, 16 Nov 2019 05:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573883424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5ppeAinJuC8+Miw24tWwYglqjydVjn6Me9me1BWEf4=;
	b=R0JHf4lRi05pHGVQ3EF/OErxli+BjBPqbAfEDpvbSbZyyTLcMkcJ3A/A2RQi84S77kJsok
	sUkdejtmkDzC/i3dEC3TjxmZyahfXpwc3OJD5Vzab5o+8IJC+MsibFFSWvNHcQkiiyLphs
	b4bV6jn3edqXAzt/f8pd5dayigVQYqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-7CMd4AMBPf6GNC2ytdZWxQ-1; Sat, 16 Nov 2019 00:50:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 084B1802466;
	Sat, 16 Nov 2019 05:50:20 +0000 (UTC)
Received: from rh2.redhat.com (ovpn-125-253.rdu2.redhat.com [10.10.125.253])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5468169183;
	Sat, 16 Nov 2019 05:50:19 +0000 (UTC)
From: Mike Christie <mchristi@redhat.com>
To: nbd@other.debian.org,
	axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org
Cc: Mike Christie <mchristi@redhat.com>
Subject: [PATCH 1/2] nbd: move send_disconnects
Date: Fri, 15 Nov 2019 23:50:16 -0600
Message-Id: <20191116055017.6253-2-mchristi@redhat.com>
In-Reply-To: <20191116055017.6253-1-mchristi@redhat.com>
References: <20191116055017.6253-1-mchristi@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 7CMd4AMBPf6GNC2ytdZWxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aDXD2lbKXQK.A.SvC.bH5zdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/734
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191116055017.6253-2-mchristi@redhat.com
Resent-Date: Sat, 16 Nov 2019 06:06:19 +0000 (UTC)

Just move send_disconnects so we can call it earlier in the file in the
next patch.

Signed-off-by: Mike Christie <mchristi@redhat.com>
---
 drivers/block/nbd.c | 48 ++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a94ee45440b3..06b63c11ae50 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -980,6 +980,30 @@ static blk_status_t nbd_queue_rq(struct blk_mq_hw_ctx =
*hctx,
 =09return ret;
 }
=20
+static void send_disconnects(struct nbd_device *nbd)
+{
+=09struct nbd_config *config =3D nbd->config;
+=09struct nbd_request request =3D {
+=09=09.magic =3D htonl(NBD_REQUEST_MAGIC),
+=09=09.type =3D htonl(NBD_CMD_DISC),
+=09};
+=09struct kvec iov =3D {.iov_base =3D &request, .iov_len =3D sizeof(reques=
t)};
+=09struct iov_iter from;
+=09int i, ret;
+
+=09for (i =3D 0; i < config->num_connections; i++) {
+=09=09struct nbd_sock *nsock =3D config->socks[i];
+
+=09=09iov_iter_kvec(&from, WRITE, &iov, 1, sizeof(request));
+=09=09mutex_lock(&nsock->tx_lock);
+=09=09ret =3D sock_xmit(nbd, i, 1, &from, 0, NULL);
+=09=09if (ret <=3D 0)
+=09=09=09dev_err(disk_to_dev(nbd->disk),
+=09=09=09=09"Send disconnect failed %d\n", ret);
+=09=09mutex_unlock(&nsock->tx_lock);
+=09}
+}
+
 static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long=
 fd,
 =09=09=09=09     int *err)
 {
@@ -1139,30 +1163,6 @@ static void nbd_parse_flags(struct nbd_device *nbd)
 =09=09blk_queue_write_cache(nbd->disk->queue, false, false);
 }
=20
-static void send_disconnects(struct nbd_device *nbd)
-{
-=09struct nbd_config *config =3D nbd->config;
-=09struct nbd_request request =3D {
-=09=09.magic =3D htonl(NBD_REQUEST_MAGIC),
-=09=09.type =3D htonl(NBD_CMD_DISC),
-=09};
-=09struct kvec iov =3D {.iov_base =3D &request, .iov_len =3D sizeof(reques=
t)};
-=09struct iov_iter from;
-=09int i, ret;
-
-=09for (i =3D 0; i < config->num_connections; i++) {
-=09=09struct nbd_sock *nsock =3D config->socks[i];
-
-=09=09iov_iter_kvec(&from, WRITE, &iov, 1, sizeof(request));
-=09=09mutex_lock(&nsock->tx_lock);
-=09=09ret =3D sock_xmit(nbd, i, 1, &from, 0, NULL);
-=09=09if (ret <=3D 0)
-=09=09=09dev_err(disk_to_dev(nbd->disk),
-=09=09=09=09"Send disconnect failed %d\n", ret);
-=09=09mutex_unlock(&nsock->tx_lock);
-=09}
-}
-
 static int nbd_disconnect(struct nbd_device *nbd)
 {
 =09struct nbd_config *config =3D nbd->config;
--=20
2.21.0

