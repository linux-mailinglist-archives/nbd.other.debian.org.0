Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C7102A83
	for <lists+nbd@lfdr.de>; Tue, 19 Nov 2019 18:09:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ECA4C209C4; Tue, 19 Nov 2019 17:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 17:09:08 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	RCVD_IN_DNSWL_MED,TO_TOO_MANY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 12B372089F
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2019 16:53:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OlQczB8s1RUU for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2019 16:53:43 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id CCCB12086D
	for <nbd@other.debian.org>; Tue, 19 Nov 2019 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574182417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dqMi9w8FGMz0iOTrsEVSdaPR96qMxP3SmDt20AyNaA=;
	b=iMW2u0uOXGv9a21SXlM22tYhgssBPfEi5mJX20mNx9NhzTy6Q3PUoVyhj1BB+pEWRr+U5/
	/bkq+KNvn9flN3ckmlhmWe7sJznjXdnG17TA2WbYGf++WzE5dGITLGi6Khx2kHKva/TEIx
	6yuEcBAzoMUBszvNjq8uoy4/H2oYJE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-UanJR99WNNSuLTN67p4xeQ-1; Tue, 19 Nov 2019 11:22:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E3338018A1;
	Tue, 19 Nov 2019 16:22:53 +0000 (UTC)
Received: from [10.10.121.199] (ovpn-121-199.rdu2.redhat.com [10.10.121.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 361F55E243;
	Tue, 19 Nov 2019 16:22:52 +0000 (UTC)
Subject: Re: [v2] nbd:fix memory leak in nbd_get_socket()
To: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <1574143751-138680-1-git-send-email-sunke32@huawei.com>
Cc: stable@vger.kernel.org
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5DD416DB.1040302@redhat.com>
Date: Tue, 19 Nov 2019 10:22:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1574143751-138680-1-git-send-email-sunke32@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UanJR99WNNSuLTN67p4xeQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Fp2M-w_K3IO.A.5zG.0GC1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/744
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5DD416DB.1040302@redhat.com
Resent-Date: Tue, 19 Nov 2019 17:09:08 +0000 (UTC)

On 11/19/2019 12:09 AM, Sun Ke wrote:
> Before return NULL,put the sock first.
>=20
> Cc: stable@vger.kernel.org
> Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
> v2: add cc:stable tag
> ---
>  drivers/block/nbd.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index a94ee45..19e7599 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -993,6 +993,7 @@ static struct socket *nbd_get_socket(struct nbd_devic=
e *nbd, unsigned long fd,
>  =09if (sock->ops->shutdown =3D=3D sock_no_shutdown) {
>  =09=09dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown call=
out must be supported.\n");
>  =09=09*err =3D -EINVAL;
> +=09=09sockfd_put(sock);
>  =09=09return NULL;
>  =09}
> =20
>=20

Reviewed-by: Mike Christie <mchristi@redhat.com>

