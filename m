Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EE184261FF
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 12:37:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B45362063F; Wed, 22 May 2019 10:37:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 10:37:38 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=4.0 tests=HTML_MESSAGE,LDOSUBSCRIBER,
	LDO_WHITELIST,MONOTONE_WORDS_2_15,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2735C2063D
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 10:37:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, HTML_MESSAGE=2, LDO_WHITELIST=-5,
	MONOTONE_WORDS_2_15=1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HtzqqWGGx-9F for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 10:37:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .mail-oi1-f180.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6230B2063C
	for <nbd@other.debian.org>; Wed, 22 May 2019 10:37:25 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id w9so1196478oic.9
        for <nbd@other.debian.org>; Wed, 22 May 2019 03:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hs6oMdaxk0heuz+uz/Lb1K9lA2nDDmx8Oq2J1qqAXUk=;
        b=V8I985gzVRurihSRRipldyxmFZO8Z+vtWsLoxNVojedWYH5rmlAIvH07yKjyhrqEf0
         srrd54lF86BE9MJlduJ22ZN7k3W6g1oS7aLT8DJwj6KuguC1jhv1bz5LqfbRADRCNIph
         j+apjT8/X6or57FtZBLlskcqEq9HkZ5UxmT0TrTYfWejQ18rC8UcrSETtq/nSYmrAGuj
         LYOHJypRxVnsOWTxMZ1srQ1B9zn9j2afEmOoB8E763AYD1jWc9PC+Yh2p0GQKPIp0yWC
         Ih4OTy7tOL8EG0Q+cAtmDLUktYj+67Ifj84pqtE0gVH+SG46UBSPgRxXIw7kvrX9WD7e
         rDEw==
X-Gm-Message-State: APjAAAXmHP/Qvjd+N6DYgptIV8SRKBZwdJl4MQlDybZHUEKK9vH17BYh
	o8ybDZ3KYXcsZ53G93QcFVjyCnV26BdGb5j5v2c4Gw==
X-Google-Smtp-Source: APXvYqzkEfCqe0YDdHHEnCj7pn+L6P8TfbqbU8TDYEqNMzkXAPEAOiUEhlU2jeXnpwbUE2wmQDObwpyNTptq3muYpRY=
X-Received: by 2002:aca:3906:: with SMTP id g6mr6302588oia.106.1558521442655;
 Wed, 22 May 2019 03:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190520092056.GA9368@redhat.com> <20190521203036.GA24332@grep.be>
 <20190521212701.GS9582@redhat.com> <20190522064220.GB24332@grep.be>
 <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com> <20190522095545.GY9582@redhat.com>
In-Reply-To: <20190522095545.GY9582@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 22 May 2019 13:37:09 +0300
Message-ID: <CAMRbyysksKPGpTe4+HUZvsEc+u2HQjxgAfaFtsC6O006=O9mgg@mail.gmail.com>
Subject: Re: Standard NBD URL syntax (again)
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org, 
	"Daniel P. Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f70c880589778c67"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Zt6Bb8RN_QN.A.MKG.yZS5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/510
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyysksKPGpTe4+HUZvsEc+u2HQjxgAfaFtsC6O006=O9mgg@mail.gmail.com
Resent-Date: Wed, 22 May 2019 10:37:38 +0000 (UTC)

--000000000000f70c880589778c67
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 12:55 PM Richard W.M. Jones <rjones@redhat.com>
wrote:

> So last night I had an important thought about this:
>
>  * What existing export names are people using in real life?
>
> nbdkit doesn't use export names for anything - you can pass
> anything you like.
>

Since you server single image you don't care about export name, but it is
strange that
the value is ignored.

qemu-nbd has an odd system where the export name must match what was
> specified on the command line, but AFAIK it doesn't care about it
> otherwise.
>

qemu-nbd fails if the export name does not match the value of --export-name
argument.

$ qemu-nbd -t -r --export-name=bar -k /tmp/nbd.sock file
$ qemu-img info nbd:unix:/tmp/nbd.sock:exportname=foo
qemu-img: Could not open 'nbd:unix:/tmp/nbd.sock:exportname=foo': Requested
export not available
server reported: export 'foo' not present

If qemu-nbd will have a capability to expose all bitmaps in an image,
specifying a bitmap
name as the export name can be useful to get data from certain point
instead of data for
the entire image.

We always use empty export name when exposing disks via NBD with qemu-nbd.

qemu's internal NBD server may permit multiple export names, but I'm
> not totally sure about that.  What do they look like?  Arbitrary
> strings?  Absolute paths?  Relative paths?
>

They are name of a temporary bitmap created by libvirt when exposing a disk
for
backup. I think currently this is the name of the disk e.g. "vda".

Accessing the export "vda" let you access the contents of the disk "vda" at
the time
the backup was started.

Since the export never refeThis must be a fully-qualified path and
filename; relative paths are not allowed.  r to a file, there is no reason
to use / in the name.

nbd-server supports multiple export names, and it does appear to want
> absolute paths.  Can it use arbitrary strings too, or are absolute
> paths the only option?  How about relative paths?
>
> Basically, I think what we most commonly use export names for should
> influence how we decide to use them in URLs.
>

According to ndb-server(5):

    This must be a fully-qualified path and filename; relative paths are
not allowed.

Nir

--000000000000f70c880589778c67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:#000000"><span style=3D"color:rgb(34,34,34)">On Wed, May=
 22, 2019 at 12:55 PM Richard W.M. Jones &lt;<a href=3D"mailto:rjones@redha=
t.com">rjones@redhat.com</a>&gt; wrote:</span><br></div></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">So last nig=
ht I had an important thought about this:<br>
<br>
=C2=A0* What existing export names are people using in real life?<br>
<br>
nbdkit doesn&#39;t use export names for anything - you can pass<br>
anything you like.<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small;color:rgb(0,0,0)">Since you server single=
 image you don&#39;t care about export name, but it is strange that</div><d=
iv class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">the v=
alue is ignored.</div></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
qemu-nbd has an odd system where the export name must match what was<br>
specified on the command line, but AFAIK it doesn&#39;t care about it<br>
otherwise.<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small;color:rgb(0,0,0)">qemu-nbd fails if the export na=
me does not match the value of --export-name</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small;color:rgb(0,0,0)">argument.</div></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">$ q=
emu-nbd -t -r --export-name=3Dbar -k /tmp/nbd.sock file<br></div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">$ qemu-img in=
fo nbd:unix:/tmp/nbd.sock:exportname=3Dfoo<br>qemu-img: Could not open &#39=
;nbd:unix:/tmp/nbd.sock:exportname=3Dfoo&#39;: Requested export not availab=
le<br>server reported: export &#39;foo&#39; not present<br></div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">If qem=
u-nbd will have a capability to expose all bitmaps in an image, specifying =
a bitmap</div><div class=3D"gmail_default" style=3D"font-size:small;color:r=
gb(0,0,0)">name as the export name can be useful to get data from certain p=
oint instead of data for</div><div class=3D"gmail_default" style=3D"font-si=
ze:small;color:rgb(0,0,0)">the entire image.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small;color:rgb(0,0,0)">We always use empty e=
xport name when exposing disks via NBD with qemu-nbd.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
qemu&#39;s internal NBD server may permit multiple export names, but I&#39;=
m<br>
not totally sure about that.=C2=A0 What do they look like?=C2=A0 Arbitrary<=
br>
strings?=C2=A0 Absolute paths?=C2=A0 Relative paths?<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small;color:r=
gb(0,0,0)">They are name of a temporary bitmap created by libvirt when expo=
sing a disk for=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:=
small;color:rgb(0,0,0)">backup. I think currently this is the name of the d=
isk e.g. &quot;vda&quot;.</div></div><div class=3D"gmail_default" style=3D"=
font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small;color:rgb(0,0,0)">Accessing the export &quot;vda&quo=
t; let you access the contents of the disk &quot;vda&quot; at the time</div=
><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">th=
e backup was started.</div><div class=3D"gmail_default" style=3D"font-size:=
small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:rgb(0,0,0)">Since the export never refeThis must be a fu=
lly-qualified path and filename; relative paths are not allowed.=C2=A0 r to=
 a file, there is no reason to use / in the name.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
nbd-server supports multiple export names, and it does appear to want<br>
absolute paths.=C2=A0 Can it use arbitrary strings too, or are absolute<br>
paths the only option?=C2=A0 How about relative paths?<br>
<br>
Basically, I think what we most commonly use export names for should<br>
influence how we decide to use them in URLs.<br></blockquote><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">Ac=
cording to ndb-server(5):</div><div class=3D"gmail_default" style=3D"font-s=
ize:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small;color:rgb(0,0,0)">=C2=A0 =C2=A0 This must be a fully-quali=
fied path and filename; relative paths are not allowed.</div><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">Ni=
r</div></div></div>

--000000000000f70c880589778c67--

