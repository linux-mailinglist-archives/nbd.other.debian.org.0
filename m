Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C326C25AE
	for <lists+nbd@lfdr.de>; Tue, 21 Mar 2023 00:36:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 46D1E20576; Mon, 20 Mar 2023 23:36:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 20 23:36:12 2023
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B133620694
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Mar 2023 23:20:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id w-1vkPYjpetl for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Mar 2023 23:20:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 1273820406
	for <nbd@other.debian.org>; Mon, 20 Mar 2023 23:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679354446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=edAWeKA9AVpZQXK8a2sLtS/AGFpK5i6GnqmCo9prCkc=;
	b=dTYIaYUkRUmhzDbQlEZEfKDfOEd2J+D1p3v2VS4FrdcaC4iGZ9svIzlBiQdd2pPIAPA6c/
	WoduBv4ZJ689dLXAbYfHFGYhtYvh/AFiRj4iQoW+2bGH1+n97x6JKlcG+vye6SzqyzWsbb
	5fkj8Bo9Q2IsiMX/LbvZs3BvbbzZnDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-0eW1T0y1PDKhrro_-ByLag-1; Mon, 20 Mar 2023 19:20:45 -0400
X-MC-Unique: 0eW1T0y1PDKhrro_-ByLag-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FE5E3C02B65;
	Mon, 20 Mar 2023 23:20:44 +0000 (UTC)
Received: from ovpn-8-29.pek2.redhat.com (ovpn-8-29.pek2.redhat.com [10.72.8.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8166440B934;
	Mon, 20 Mar 2023 23:20:38 +0000 (UTC)
Date: Tue, 21 Mar 2023 07:20:33 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ming.lei@redhat.com
Subject: Re: [PATCH v2 2/5] block nbd: send handle in network order
Message-ID: <ZBjqQckL7d5EJPlh@ovpn-8-29.pek2.redhat.com>
References: <20230317202749.419094-1-eblake@redhat.com>
 <20230317202749.419094-3-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317202749.419094-3-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <idXgDBKPR1K.A.ZhD.s3OGkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2401
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZBjqQckL7d5EJPlh@ovpn-8-29.pek2.redhat.com
Resent-Date: Mon, 20 Mar 2023 23:36:12 +0000 (UTC)

On Fri, Mar 17, 2023 at 03:27:46PM -0500, Eric Blake wrote:
> The NBD spec says the client handle (or cookie) is opaque on the
> server, and therefore it really doesn't matter what endianness we use;
> to date, the use of memcpy() between u64 and a char[8] has exposed
> native endianness when treating the handle as a 64-bit number.

No, memcpy() works fine for char[8], which doesn't break endianness.

> However, since NBD protocol documents that everything else is in
> network order, and tools like Wireshark will dump even the contents of
> the handle as seen over the network, it's worth using a consistent
> ordering regardless of the native endianness.
> 
> Plus, using a consistent endianness now allows an upcoming patch to
> simplify this to directly use integer assignment instead of memcpy().

It isn't necessary, given ->handle is actually u64, which is handled by
nbd client only.

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> v2: new patch
> ---
>  drivers/block/nbd.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 592cfa8b765a..8a9487e79f1c 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -560,6 +560,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
>  	unsigned long size = blk_rq_bytes(req);
>  	struct bio *bio;
>  	u64 handle;
> +	__be64 tmp;
>  	u32 type;
>  	u32 nbd_cmd_flags = 0;
>  	int sent = nsock->sent, skip = 0;
> @@ -606,7 +607,8 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
>  		request.len = htonl(size);
>  	}
>  	handle = nbd_cmd_handle(cmd);
> -	memcpy(request.handle, &handle, sizeof(handle));
> +	tmp = cpu_to_be64(handle);
> +	memcpy(request.handle, &tmp, sizeof(tmp));

This way copies handle two times, really not fun.


thanks,
Ming

