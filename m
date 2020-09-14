Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3F26927B
	for <lists+nbd@lfdr.de>; Mon, 14 Sep 2020 19:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7AA5B20198; Mon, 14 Sep 2020 17:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 14 17:06:09 2020
Old-Return-Path: <gregorhaas1997@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4A1D620187
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Sep 2020 16:48:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XZZdQlRHOqtB for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Sep 2020 16:48:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7836E2012C
	for <nbd@other.debian.org>; Mon, 14 Sep 2020 16:48:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id o8so894237ejb.10
        for <nbd@other.debian.org>; Mon, 14 Sep 2020 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=QhKlbCCL2ipyyCxGaswn7sv9ShIIJYD5MeSVTLvxdgY=;
        b=Sbx/JzAg7XJmY7frSF0s2YUSG/e28RWUHh5hcxTZlpgCSub7YEMOf8joL+2jlmO3SM
         PHOzD/jqp4y/8k3xonTqsyVzMNYdyzjTWytZjNBkzjrasxNzeqlPAqZVTkF68EStEANe
         Pgenzxvm0qoe7eis2Foy35uQdlvTyNbVkCcjwb1bpAm92ilJHV/hVlfBRAeoRV3uUF/J
         pAJlSHwtWh3rqaru406KNaEGAg3Zn37Laxcyq0hw4XNsEuYin9gUkK1NzCBNUE2u9qtj
         XPzZqhLtGiIGGjtnD5IcxSS6IFeutQ5Qq9Pu808KiqDTHfe9PQ8mG2sOD1QHfmcQ6UcW
         B/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=QhKlbCCL2ipyyCxGaswn7sv9ShIIJYD5MeSVTLvxdgY=;
        b=PnVVxwDQMZSbaPnJ1cbw4Tyojpj73PEhjBsSYYabeI0PWL4RZUUbBhNUSGRcDlggkc
         ABA3vr4Zur9vD4Ks+nUSNgiwEhCGoZJ/KOymCetASbmCp3dRhqNmpTfkCxUkqcXkrGXK
         emv6r33qiP4gSrnxmcgcvbl16FxoMAdjdDfHs9IPF8fzJwYDxV2X9rHdimeJvDiCSqs1
         zgBRQPe1t5iQVyGQZ/nrcrcrXqrER0yrqbxxSEpI7ZNYc6LtiVtu//L5kFrHg7ADIvai
         oXs4BgYNLMgPbnoC0NhWIuvbllbAZjOzUNbZ1VAGY6ItAi/KZrV3yiz9sa836z35sTej
         lJVw==
X-Gm-Message-State: AOAM5334Bb91nmHsBSBctLbGFWp/8Lk4kWBnOeDwbbyzKTYEywRx+q78
	WqTKu3hXlxNk8CElQm/XPnzgRhARFeQ7GmP4xsgYNHq1Mfg=
X-Google-Smtp-Source: ABdhPJxyzf3j+oXocsWA/sJeo1UGrH+GAbVVG+dT+CPe57z8bpM521j+1maqZO7/uwc+XX1J3KnxVFDQh1GzigBQ6zY=
X-Received: by 2002:a17:906:d9c3:: with SMTP id qk3mr3818588ejb.207.1600102099916;
 Mon, 14 Sep 2020 09:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqWt3oixWoLuHUUxeRZDPAJGoF_M0sOZtVNfbiaaSq8KxjN0g@mail.gmail.com>
 <166c6457-0ad7-cb3d-d1d3-83c8e6de35a7@redhat.com>
In-Reply-To: <166c6457-0ad7-cb3d-d1d3-83c8e6de35a7@redhat.com>
From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Mon, 14 Sep 2020 12:47:38 -0400
Message-ID: <CAMqWt3pwsozO145PagT+uEAGKReABMmVfinFURojaoyGJCn-dw@mail.gmail.com>
Subject: Re: Mounting from multiple devices
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Content-Type: multipart/alternative; boundary="000000000000451a0a05af48cdd3"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AeZtBZSc4XO.A._7B.BM6XfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/979
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMqWt3pwsozO145PagT+uEAGKReABMmVfinFURojaoyGJCn-dw@mail.gmail.com
Resent-Date: Mon, 14 Sep 2020 17:06:09 +0000 (UTC)

--000000000000451a0a05af48cdd3
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

Thank you for the quick response. I'm still pretty new to playing with
filesystems
so thank you also for the information about clustered filesystems. I'll be
looking
into these for my use case.

So essentially, any synchronization for parallel clients would have to
happen at
the filesystem layer -- NBD has no mechanisms in place for that, and simply
exports a raw block device. Is my understanding of that correct?

Thank you,
Gregor Haas

On Mon, Sep 14, 2020 at 12:34 PM Eric Blake <eblake@redhat.com> wrote:

> On 9/14/20 11:03 AM, Gregor Haas wrote:
> > Hi all,
> >
> > First off, thank you for developing NBD. I've really been enjoying using
> it
> > recently - accessing raw block devices over a network fits very well into
> > my various use cases.
> >
> > However, I've found some conflicting documentation about the _safety_ of
> > accessing an exported block device from multiple clients. Notably, the
> > sourceforge page (https://nbd.sourceforge.io/) states that "if someone
> has
> > mounted NBD read/write, you must assure that no one else will have it
> > mounted". In contrast, the documentation in the current Linux tree (
> >
> https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/blockdev/nbd.rst
> )
> > does omits this sentence, implying that it is okay for multiple clients
> to
> > mount NBD read/write.
> >
> > Let's say I have an ext4 filesystem on an NBD. Is it safe for me to mount
> > this filesystem on multiple clients?
>
> No.  It is not safe to mount an ext4 image from parallel clients.  Ever.
>
> There are some clustered filesystems that are designed to be network
> safe, and can tolerate having multiple clients (whether one writer and
> multiple readers, or even multiple writers), because the writers take
> care to coordinate with each other before overwriting the same portion
> of the shared storage (in fact, that shared access is _how_ clustered
> filesystems are able to hand off control between which machine in the
> cluster is currently serving storage).  But most non-clustered
> filesystems (ext4 included) assume that they have exclusive control over
> the block storage, and you can cause massive corruption if that
> assumption doesn't hold because you mounted in parallel through a second
> user.
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>
>

--000000000000451a0a05af48cdd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Eric,<div><br></div><div>Thank you for the quick respon=
se. I&#39;m still pretty new to playing with filesystems</div><div>so thank=
 you also for the information about clustered filesystems. I&#39;ll be look=
ing=C2=A0</div><div>into these for my use case.</div><div><br></div><div>So=
 essentially, any synchronization for parallel clients would have to happen=
 at</div><div>the filesystem layer -- NBD has no mechanisms in place for th=
at, and simply</div><div>exports a raw block device. Is my understanding of=
 that correct?</div><div><br></div><div>Thank you,</div><div>Gregor Haas</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Sep 14, 2020 at 12:34 PM Eric Blake &lt;<a href=3D"mailto:eblake=
@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On 9/14/20 11:03 AM, Gregor Haas wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; First off, thank you for developing NBD. I&#39;ve really been enjoying=
 using it<br>
&gt; recently - accessing raw block devices over a network fits very well i=
nto<br>
&gt; my various use cases.<br>
&gt; <br>
&gt; However, I&#39;ve found some conflicting documentation about the _safe=
ty_ of<br>
&gt; accessing an exported block device from multiple clients. Notably, the=
<br>
&gt; sourceforge page (<a href=3D"https://nbd.sourceforge.io/" rel=3D"noref=
errer" target=3D"_blank">https://nbd.sourceforge.io/</a>) states that &quot=
;if someone has<br>
&gt; mounted NBD read/write, you must assure that no one else will have it<=
br>
&gt; mounted&quot;. In contrast, the documentation in the current Linux tre=
e (<br>
&gt; <a href=3D"https://github.com/torvalds/linux/blob/master/Documentation=
/admin-guide/blockdev/nbd.rst" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/torvalds/linux/blob/master/Documentation/admin-guide/blockdev/n=
bd.rst</a>)<br>
&gt; does omits this sentence, implying that it is okay for multiple client=
s to<br>
&gt; mount NBD read/write.<br>
&gt; <br>
&gt; Let&#39;s say I have an ext4 filesystem on an NBD. Is it safe for me t=
o mount<br>
&gt; this filesystem on multiple clients?<br>
<br>
No.=C2=A0 It is not safe to mount an ext4 image from parallel clients.=C2=
=A0 Ever.<br>
<br>
There are some clustered filesystems that are designed to be network <br>
safe, and can tolerate having multiple clients (whether one writer and <br>
multiple readers, or even multiple writers), because the writers take <br>
care to coordinate with each other before overwriting the same portion <br>
of the shared storage (in fact, that shared access is _how_ clustered <br>
filesystems are able to hand off control between which machine in the <br>
cluster is currently serving storage).=C2=A0 But most non-clustered <br>
filesystems (ext4 included) assume that they have exclusive control over <b=
r>
the block storage, and you can cause massive corruption if that <br>
assumption doesn&#39;t hold because you mounted in parallel through a secon=
d <br>
user.<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3226<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div>

--000000000000451a0a05af48cdd3--

