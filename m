Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EF06B5B8F
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 13:23:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A7B23205FD; Sat, 11 Mar 2023 12:23:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 12:23:32 2023
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 00654205AD
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 12:23:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kIcHvKzQlR-7 for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 12:23:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id ED429205AC
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678537389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0ncK7kQPU4tM41Xw7Dto2fGmFTmgA/05JfWF548UL4=;
	b=NPlsiPloiG+YmxFk0KemWKo0rdhPCzqj2Sb2ZH1qHjjdGKE/n9OihGGWjb2iQh5Oe4kmU7
	XT/ue6OzFBDjxtKlsSpiWzn1siJQEK1Qj70yuE9q28sT0fOf1sAZs8W8auXie3++dKbs1I
	Lw/s6WSaoXJijgtucNVj0t54mFegoiw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-aQ2_5xmTOomMeyiWPsFYdg-1; Sat, 11 Mar 2023 07:23:07 -0500
X-MC-Unique: aQ2_5xmTOomMeyiWPsFYdg-1
Received: by mail-qk1-f197.google.com with SMTP id eb13-20020a05620a480d00b00742be8a1a17so4504410qkb.18
        for <nbd@other.debian.org>; Sat, 11 Mar 2023 04:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678537387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0ncK7kQPU4tM41Xw7Dto2fGmFTmgA/05JfWF548UL4=;
        b=mC8lgmHsNMBeBubIOmAekiRWJIXQVv1ypVi6RkWuINyW1ESOTw0L68Lk2MkTc/hTlJ
         23KLhkUMDD8+BqnX0oGIIhmlENMPmNDmr8v022SajPKoSk2VCENNFq54PK58n+1RyM6R
         fOYMr2clQmv27lkb0auIvKs4xgGWm+IERizrv+FJrvhgGsKyP1lznK7c7Yj0ecDhKOH2
         YHkjhzssahP4m/mTVoYprjjcLw4ojRDjfRHABt2HChpEg7j2Y4CQnVMNdz1XuCpV0Ajt
         tod56ZxRwXh3WSCZgZycXDDvfuO+/1v6k1eOp2DboCguPmVPLZxU3+a/D7JYyK70xNlu
         2EjQ==
X-Gm-Message-State: AO0yUKUp4iI8uHdKkT35uCBtcs+OX0LIYOMu7CqZhIpYuSXk+WPjTbhK
	NjQhWbVmD8n/TO4ATuzFAdB4NDdHVaUv1AWQ7gIylSuaLP7m008mO0stpWevhebm/rUSA4CKFZ8
	m0Pggi8r7owOYmOuwXq3xLqUSsRxgTw==
X-Received: by 2002:ae9:f00a:0:b0:742:6e03:4091 with SMTP id l10-20020ae9f00a000000b007426e034091mr1365180qkg.6.1678537387468;
        Sat, 11 Mar 2023 04:23:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+ahdPUjKtqLXS4t/tIFiVrX+FhWFPj4c7AdJccBkphBZCKDMNyJB/8I64SarjmIvrKHtooaHXg7cKfznTu95I=
X-Received: by 2002:ae9:f00a:0:b0:742:6e03:4091 with SMTP id
 l10-20020ae9f00a000000b007426e034091mr1365155qkg.6.1678537387081; Sat, 11 Mar
 2023 04:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20230310201525.2615385-1-eblake@redhat.com> <20230310201525.2615385-4-eblake@redhat.com>
In-Reply-To: <20230310201525.2615385-4-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sat, 11 Mar 2023 14:22:51 +0200
Message-ID: <CAMRbyyv59L9GiLr5tJvnNdwnBNdNGw+xveG7S63WC9ycOuJYrA@mail.gmail.com>
Subject: Re: [PATCH 3/3] block nbd: use req.cookie instead of req.handle
To: Eric Blake <eblake@redhat.com>
Cc: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org, 
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <56dtJaqKzXC.A.swE.ELHDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2374
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyv59L9GiLr5tJvnNdwnBNdNGw+xveG7S63WC9ycOuJYrA@mail.gmail.com
Resent-Date: Sat, 11 Mar 2023 12:23:32 +0000 (UTC)

On Fri, Mar 10, 2023 at 10:16=E2=80=AFPM Eric Blake <eblake@redhat.com> wro=
te:
>
> A good compiler should not compile this any differently, but it seems
> nicer to avoid memcpy() when integer assignment will work.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  drivers/block/nbd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 592cfa8b765a..672fb8d1ce67 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -606,7 +606,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struc=
t nbd_cmd *cmd, int index)
>                 request.len =3D htonl(size);
>         }
>         handle =3D nbd_cmd_handle(cmd);

This returns native u64 (likely little endian) but the new interface
specifies __be64. Should we swap the bytes if needed?

This will help tools like the wireshark plugin to display the right value
when checking traces from machines with different endianness. Or help
the nbd server to show the same *cooike* value in the logs. The value
is opaque but reasonable code can assume that __be64 can be safely
parsed as an integer.

> -       memcpy(request.handle, &handle, sizeof(handle));
> +       request.cookie =3D handle;
>
>         trace_nbd_send_request(&request, nbd->index, blk_mq_rq_from_pdu(c=
md));
>
> @@ -732,7 +732,7 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_de=
vice *nbd, int index,
>         u32 tag;
>         int ret =3D 0;
>
> -       memcpy(&handle, reply->handle, sizeof(handle));
> +       handle =3D reply->cookie;
>         tag =3D nbd_handle_to_tag(handle);
>         hwq =3D blk_mq_unique_tag_to_hwq(tag);
>         if (hwq < nbd->tag_set.nr_hw_queues)
> --
> 2.39.2
>

Also the same file has references to *handle* like:

static u64 nbd_cmd_handle(struct nbd_cmd *cmd)
{
    struct request *req =3D blk_mq_rq_from_pdu(cmd);
    u32 tag =3D blk_mq_unique_tag(req);
    u64 cookie =3D cmd->cmd_cookie;

    return (cookie << NBD_COOKIE_BITS) | tag;
}

static u32 nbd_handle_to_tag(u64 handle)
{
    return (u32)handle;
}

static u32 nbd_handle_to_cookie(u64 handle)
{
    return (u32)(handle >> NBD_COOKIE_BITS);
}

So this change is a little bit confusing.

I think we need to use a term like *nbd_cookie* instead of
*handle* to make this more clear.

Nir

