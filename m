Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 895AC5B67AB
	for <lists+nbd@lfdr.de>; Tue, 13 Sep 2022 08:15:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6CD03207B2; Tue, 13 Sep 2022 06:15:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 13 06:15:13 2022
Old-Return-Path: <gordan.bobic@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	HTML_MESSAGE,MURPHY_SCAM1,RCVD_IN_DNSWL_NONE,T_KAM_HTML_FONT_INVALID,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8B3A5207A0
	for <lists-other-nbd@bendel.debian.org>; Tue, 13 Sep 2022 05:57:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.001 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, HTML_MESSAGE=2, MURPHY_SCAM1=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_KAM_HTML_FONT_INVALID=0.01,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xddQ2d8WjUrQ for <lists-other-nbd@bendel.debian.org>;
	Tue, 13 Sep 2022 05:56:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A30782079D
	for <nbd@other.debian.org>; Tue, 13 Sep 2022 05:56:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id wc11so10452099ejb.4
        for <nbd@other.debian.org>; Mon, 12 Sep 2022 22:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LhaC85uXqyGVrn/aZT5m/zJGY0Fitibw0U/Zs+tqFdE=;
        b=DlGPrkQC1BGpCHu1SNyuswn52KxwgONoSOXolkVIgPB6izoQLy6kuPo0LaFwSNDq1y
         JbRmD4esJPSriEg5/C0mBAWMwniTZXizy25a8HHWRfItlaHJa6ePx5FG+bUElETfObPF
         dNNe8Y2gmzAE/sBMeBpCTnwqBZceeVv80Hd1ljFEm2G7uN6YvwiJiUU0V67L7Nnq5hUv
         WxLTJOrt3J8had6w42KF9MtHJJxmyjkQAkHhyFlfMHxGxyEbG1/L52wQnPMSBJjY99CQ
         c+W+WA2DlkZJEEeJagejtKyCx29x33MSVvAXf9vWsVsGPDcryqh1hDdIAZtdg5R8UTU2
         XqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LhaC85uXqyGVrn/aZT5m/zJGY0Fitibw0U/Zs+tqFdE=;
        b=SWcaYQzhvf68TFsP/yAkre8Sr0VGVkZ4P7PDCqA+AjTsw+VniLCYA5880n0Uco+F1z
         9wzZksX+o/v8xwGyeGdO6q516eTpZY0ckhe6uufwDJeFnF4X8Fd4804kxeu+qAA+GG0T
         pw8QL/+ksMPNYFBpwn5hpKYkajXDwNSRrbdHmG187lD95JGVOedFvMTUvcuKI1XEyruT
         3D65Wd7MIn64FrK5BMRRgLT/PS4TzeJvFZO/rkRDh3Vri8zLXxhGepwGyHfzb8Igk1wK
         ByFE/6P4Axgo354XnJ5DKtKqfsMKCxtfdDaR/E2M9ZoEM8bdk08jsqoZkVTrvF3KVBCM
         +m7g==
X-Gm-Message-State: ACgBeo0OMjScbUbXZ3FmxViyYyc2DjLCVcmCPxRPUgXPRkLUa6gC8REC
	/pnJq70TOkP6/0IWT8hHRMO6JTD/OrxzNzPhJWs=
X-Google-Smtp-Source: AA6agR6/8C4vXMTlNtXHW9uXvLZ/8Le5tJi7oqc1XoGWpLkHHFxs4+mFBnXIwIInzjcqtz2ckhDA1nwLMmTyaZR7juE=
X-Received: by 2002:a17:907:7fa5:b0:730:5d54:4c24 with SMTP id
 qk37-20020a1709077fa500b007305d544c24mr20832662ejc.641.1663048612422; Mon, 12
 Sep 2022 22:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com>
In-Reply-To: <ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com>
From: Gordan Bobic <gordan.bobic@gmail.com>
Date: Tue, 13 Sep 2022 08:56:39 +0300
Message-ID: <CAMx4oe3Evqe=UfJNVnz=j_n=jgPopUyaoHqx2R=cbE9OMAOB0g@mail.gmail.com>
Subject: Re: [zfs-discuss] ZFS-on-NBD
To: Discuss <zfs-discuss@list.zfsonlinux.org>
Cc: libguestfs@redhat.com, nbd@other.debian.org
Content-Type: multipart/alternative; boundary="000000000000c9a88205e888ad72"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <y2M1xQyb2oG.A.gSB.x_BIjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2222
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMx4oe3Evqe=UfJNVnz=j_n=jgPopUyaoHqx2R=cbE9OMAOB0g@mail.gmail.com
Resent-Date: Tue, 13 Sep 2022 06:15:13 +0000 (UTC)

--000000000000c9a88205e888ad72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Isn't ZFS getting native object storage capability soon? It was showcased
at the last OpenZFS summit.


On Mon, 12 Sep 2022, 23:53 Nikolaus Rath, <nikolaus@rath.org> wrote:

> Hi all,
>
> In case people have been wondering about the background of the various
> questions that I asked on these lists in the last few months:
>
> I've been experimenting with running ZFS-on-NBD as a cloud backup solutio=
n
> (and potential alternative to S3QL, which I am using for this purpose at
> the moment).
>
> In case someone is interested, here is the (rather long) write-up:
> https://www.rath.org/s3ql-vs-zfs-on-nbd.html
>
> Best,
> -Nikolaus
>
> --
> GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F
>
>              =C2=BBTime flies like an arrow, fruit flies like a Banana.=
=C2=AB
>
>
> *zfsonlinux <https://zfsonlinux.topicbox.com/latest>* / Discuss / see
> discussions <https://zfsonlinux.topicbox.com/groups/zfs-discuss> +
> participants <https://zfsonlinux.topicbox.com/groups/zfs-discuss/members>
> + delivery options
> <https://zfsonlinux.topicbox.com/groups/zfs-discuss/subscription>
> Permalink
> <https://zfsonlinux.topicbox.com/groups/zfs-discuss/Tf25eefa7a2a2b7c5-M63=
ad3646a9cbbcd7e07410ed>
>

--000000000000c9a88205e888ad72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Isn&#39;t ZFS getting native object storage capability so=
on? It was showcased at the last OpenZFS summit.<div dir=3D"auto"><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, 12 Sep 2022, 23:53 Nikolaus Rath, &lt;<a href=3D"mailto:nikolaus@r=
ath.org">nikolaus@rath.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><u></u>
<div><div>Hi all,<br></div><div><br></div><div>In case people have been won=
dering about the background of the various questions that I asked on these =
lists in the last few months: <br></div><div><br></div><div>I&#39;ve been e=
xperimenting with running ZFS-on-NBD as a cloud backup solution (and potent=
ial alternative to S3QL, which I am using for this purpose at the moment).<=
br></div><div><br></div><div>In case someone is interested, here is the (ra=
ther long) write-up: <a href=3D"https://www.rath.org/s3ql-vs-zfs-on-nbd.htm=
l" target=3D"_blank" rel=3D"noreferrer">https://www.rath.org/s3ql-vs-zfs-on=
-nbd.html</a><br></div><div><br></div><div>Best,<br></div><div>-Nikolaus<br=
></div><div><br></div><div id=3D"m_-2313995457479505641sig33580657"><div>--=
<br></div><div>GPG Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4=
E 599F<br></div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=BBTime flies like an arrow, fruit fli=
es like a Banana.=C2=AB<br></div><div><br></div></div><div><br></div><div i=
d=3D"m_-2313995457479505641topicbox-footer" style=3D"margin:10px 0 0;border=
-top:1px solid #ddd;border-color:rgba(0,0,0,.15);padding:7px 0">

<strong><a href=3D"https://zfsonlinux.topicbox.com/latest" style=3D"color:i=
nherit;text-decoration:none" target=3D"_blank" rel=3D"noreferrer">zfsonlinu=
x</a></strong>
  / Discuss / see
<a href=3D"https://zfsonlinux.topicbox.com/groups/zfs-discuss" target=3D"_b=
lank" rel=3D"noreferrer">discussions</a>
  +
<a href=3D"https://zfsonlinux.topicbox.com/groups/zfs-discuss/members" targ=
et=3D"_blank" rel=3D"noreferrer">participants</a>
  +
<a href=3D"https://zfsonlinux.topicbox.com/groups/zfs-discuss/subscription"=
 target=3D"_blank" rel=3D"noreferrer">delivery=C2=A0options</a>
<a href=3D"https://zfsonlinux.topicbox.com/groups/zfs-discuss/Tf25eefa7a2a2=
b7c5-M63ad3646a9cbbcd7e07410ed" style=3D"float:right" target=3D"_blank" rel=
=3D"noreferrer">Permalink</a>
</div>
</div></blockquote></div>

--000000000000c9a88205e888ad72--

