Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D4035FABA
	for <lists+nbd@lfdr.de>; Tue, 30 Apr 2019 15:43:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B3D2320439; Tue, 30 Apr 2019 13:43:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 30 13:43:35 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=4.0 tests=FOURLA,HTML_MESSAGE,
	LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7F4CC203CA
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 Apr 2019 13:43:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.064 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, HTML_MESSAGE=2, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.164]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BJte9mWLismP for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 Apr 2019 13:43:24 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .mail-ot1-f45.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BFA0E2037F
	for <nbd@other.debian.org>; Tue, 30 Apr 2019 13:43:20 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id a10so3110592otl.12
        for <nbd@other.debian.org>; Tue, 30 Apr 2019 06:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lu97pNRGxfPKk3f10kPqHDS7VeTaPZoZBEs6FHeWgrc=;
        b=e8SCAjhu7YwpXaaJgdbISWVKFKgmB5KcHFsnlKfGKht9zFIAJZ/Qxsat+DE+GK81BQ
         u90a2hg6e1fzurYj9OTsBN4/G//sCKb9BNPPSt44VkX2PIDm3sUT6DySJsIvkk7+CDgM
         lLN6PJroOJRJCaw6MyOjwKskPCJwhv2fSBy9S3BQORqFL+xLacsX+L1m58CyV7CS83u8
         ENd7PqIwBztMfM73cfbVcKv5ScMVTCFR+02kTk6wRJpm49as5oB2yP9tRgK6r9hFr31A
         iF7RBwhAUIdhazl/lWTeY3qfETinLRPMtXE6HI+JovLMikQcfuRSYIdb/sU1w6cWQA1z
         GoeA==
X-Gm-Message-State: APjAAAXnz3V64iNJ6aWK4JA8Ws6F9MLopYvwj0lXoqT14CQIBsOvSIj5
	4eNJ2rEKtY1OyfOMOYoOooLf8PEoabpTAaPBgdjh6A==
X-Google-Smtp-Source: APXvYqzkvyxebjAz4hhfHQjeUmaH71WoWav3dTDo5pazKTeCdPhd3Ww8wCHEuTBVveQ/CXRxFvcoCZtw0iwxX91GC8U=
X-Received: by 2002:a9d:39e1:: with SMTP id y88mr1664201otb.97.1556631796784;
 Tue, 30 Apr 2019 06:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190430124626.GA11138@redhat.com>
In-Reply-To: <20190430124626.GA11138@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 30 Apr 2019 16:43:03 +0300
Message-ID: <CAMRbyytny=8nC1LevEBwYN9cbuzJwG_HjdN5QQsXR-+ROy-MpA@mail.gmail.com>
Subject: Re: Requirements for an NBD client library in userspace
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>, mkletzan@redhat.com
Content-Type: multipart/alternative; boundary="0000000000004b46ef0587bf9558"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kEi7X-TFHCH.A.WtG.HEFycB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/484
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyytny=8nC1LevEBwYN9cbuzJwG_HjdN5QQsXR-+ROy-MpA@mail.gmail.com
Resent-Date: Tue, 30 Apr 2019 13:43:35 +0000 (UTC)

--0000000000004b46ef0587bf9558
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones <rjones@redhat.com> wrote:

> I believe there is no simple NBD client library.  Am I wrong about
> this?  Let's assume I'm not for the sake of the rest of this email ...
>
> We do however have at least 4 places this could be consumed if it existed:
>
>  - fio's proposed NBD engine
>    https://www.spinics.net/lists/fio/msg07831.html
>
>  - nbdkit-nbd-plugin
>    https://github.com/libguestfs/nbdkit/tree/master/plugins/nbd
>
>  - Martin K's forthcoming VMware liberation tool
>
>  - qemu, maybe?
>    https://github.com/qemu/qemu/blob/master/block/nbd-client.c


oVirt imageio, replacing pure python client, used to implement nbd-http
proxy
https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_imageio_common/nbd.py


> In this email I'm trying to assemble some requirements for such a
> library, and I've also attempted to categorize them according to how
> difficult they might be to implement.  I guess everyone will have
> their own opinions on which features are most "required" and which are
> optional, but I've added mine below too.
>
> Did I miss out anything?
>
> 1 = easy to implement  ...  5 = hard to implement
> |
> | R* = required, library could not be used without it
> | R  = required
> | O+ = optional, but very useful for many users
> | O  = optional
> | O- = optional, not likely to be useful for many users
> | |
> v v
>
> 1 R*   Library which runs in userspace, callable from C programs
>
> 3 O+   Callable from other programming languages, eg Python etc.
>
> 1 R*   Connect to Unix domain socket
>
> 1 R*   Connect to TCP port
>
> 1 R    Connect to TCP port over IPv6
>
> 1 O-   Connect to arbitrary file descriptor [eg. for nbdkit -s]
>
> 2 R    Synchronous support for easy initial use
>
> 5 O+   Non-blocking/asynch support, use with select/poll
>
> 4 O+   Integrates with external main loops, glib2, APR pollset, etc.
>
> 4 O    TLS support using X.509 certs
>
> 4 O    TLS-PSK support
>
> 5 O    NBD MULTI_CONN
>
> 5 O    NBD out of order requests on single socket
>
> 2 O-   Old-style protocol
>
> 3 R    NBD_OPT_INFO mode [required for qemu]
>
> 5 O    NBD structured replies
>

Should be O+, this gives huge performance improvment when reading mostly
empty range, even without block status.

This is also not so hard to implement, maybe 3?


> 3 O+   NBD block status querying
>

Should be able to query qemu meta context


> ? ?    NBD resize extension
>

Nir

--0000000000004b46ef0587bf9558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones &lt;<a =
href=3D"mailto:rjones@redhat.com">rjones@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">I believe there is no simple NBD client lib=
rary.=C2=A0 Am I wrong about<br>
this?=C2=A0 Let&#39;s assume I&#39;m not for the sake of the rest of this e=
mail ...<br>
<br>
We do however have at least 4 places this could be consumed if it existed:<=
br>
<br>
=C2=A0- fio&#39;s proposed NBD engine<br>
=C2=A0 =C2=A0<a href=3D"https://www.spinics.net/lists/fio/msg07831.html" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://www.spinics.net/lists=
/fio/msg07831.html</a><br>
<br>
=C2=A0- nbdkit-nbd-plugin<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/libguestfs/nbdkit/tree/master/pl=
ugins/nbd" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/libguestfs/nbdkit/tree/master/plugins/nbd</a><br>
<br>
=C2=A0- Martin K&#39;s forthcoming VMware liberation tool<br>
<br>
=C2=A0- qemu, maybe?<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/qemu/qemu/blob/master/block/nbd-=
client.c" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/qemu/qemu/blob/master/block/nbd-client.c</a></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">oVirt imageio, replacing pure pyt=
hon client, used to implement nbd-http proxy</div><div dir=3D"auto"><a href=
=3D"https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_imageio=
_common/nbd.py">https://github.com/oVirt/ovirt-imageio/blob/master/common/o=
virt_imageio_common/nbd.py</a></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
In this email I&#39;m trying to assemble some requirements for such a<br>
library, and I&#39;ve also attempted to categorize them according to how<br=
>
difficult they might be to implement.=C2=A0 I guess everyone will have<br>
their own opinions on which features are most &quot;required&quot; and whic=
h are<br>
optional, but I&#39;ve added mine below too.<br>
<br>
Did I miss out anything?<br>
<br>
1 =3D easy to implement=C2=A0 ...=C2=A0 5 =3D hard to implement<br>
|<br>
| R* =3D required, library could not be used without it<br>
| R=C2=A0 =3D required<br>
| O+ =3D optional, but very useful for many users<br>
| O=C2=A0 =3D optional<br>
| O- =3D optional, not likely to be useful for many users<br>
| |<br>
v v<br>
<br>
1 R*=C2=A0 =C2=A0Library which runs in userspace, callable from C programs<=
br>
<br>
3 O+=C2=A0 =C2=A0Callable from other programming languages, eg Python etc.<=
br>
<br>
1 R*=C2=A0 =C2=A0Connect to Unix domain socket<br>
<br>
1 R*=C2=A0 =C2=A0Connect to TCP port<br>
<br>
1 R=C2=A0 =C2=A0 Connect to TCP port over IPv6<br>
<br>
1 O-=C2=A0 =C2=A0Connect to arbitrary file descriptor [eg. for nbdkit -s]<b=
r>
<br>
2 R=C2=A0 =C2=A0 Synchronous support for easy initial use<br>
<br>
5 O+=C2=A0 =C2=A0Non-blocking/asynch support, use with select/poll<br>
<br>
4 O+=C2=A0 =C2=A0Integrates with external main loops, glib2, APR pollset, e=
tc.<br>
<br>
4 O=C2=A0 =C2=A0 TLS support using X.509 certs<br>
<br>
4 O=C2=A0 =C2=A0 TLS-PSK support<br>
<br>
5 O=C2=A0 =C2=A0 NBD MULTI_CONN<br>
<br>
5 O=C2=A0 =C2=A0 NBD out of order requests on single socket<br>
<br>
2 O-=C2=A0 =C2=A0Old-style protocol<br>
<br>
3 R=C2=A0 =C2=A0 NBD_OPT_INFO mode [required for qemu]<br>
<br>
5 O=C2=A0 =C2=A0 NBD structured replies<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Should be O+, this gives huge perfor=
mance improvment when reading mostly empty range, even without block status=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This is also not so ha=
rd to implement, maybe 3?</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
3 O+=C2=A0 =C2=A0NBD block status querying<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Should be able to query qemu meta=
 context</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
? ?=C2=A0 =C2=A0 NBD resize extension<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Nir</div></div>

--0000000000004b46ef0587bf9558--

