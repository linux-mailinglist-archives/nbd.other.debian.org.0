Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4B1A7C8
	for <lists+nbd@lfdr.de>; Sat, 11 May 2019 14:28:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E6D9820645; Sat, 11 May 2019 12:28:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 11 12:28:57 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=4.0 tests=FOURLA,HTML_MESSAGE,
	LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5A4912068C
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 May 2019 12:28:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, HTML_MESSAGE=2, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lps6YMAr0FpZ for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 May 2019 12:28:45 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .mail-ot1-f67.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 802242065D
	for <nbd@other.debian.org>; Sat, 11 May 2019 12:28:45 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r7so3458126otn.6
        for <nbd@other.debian.org>; Sat, 11 May 2019 05:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIKlT4r3v6a0fROPyjJlJDbZ7pI7683OD/TYx6KbkyY=;
        b=PrR471idwDfJdCjtGWEgSsilGmlRcL89//3/U8E8bvLpgx9CWf6CiqYhPnrJbOOc9i
         T6SeCS3ln61dF4+p7spg7+QG1A0ANLFgrOgHpd7m1updlKAz3cO7BtOQoyb2Q5dzVbyH
         1fy+iIoCInlwJxQlwuT0B2KnjPDSeigRY05956i1hzIb9RX+nfEO4/36lyk2Lz24xkhq
         xiki6cflmmTIq+gm8uMGX2ylxkVNMRnS9zvbXmteNz2WHKpLw19zPfFDG9+r1UeVn3Bx
         ZlCGPRpqxN6qELWawOSsqgRHtdjFSqip1LSqRR0l5KKmG0dTfbsDI6FValVrAOZq/Nef
         VLfQ==
X-Gm-Message-State: APjAAAWTRuddLNhIStf6TQIE+3UR4khJlmoHFN12WxX4Hb4xGc+byk6p
	76zWn2w2gyyiOxLflIfy0UA3NomlNxXJnm+KsGvuGQ==
X-Google-Smtp-Source: APXvYqxX8/p8iWQlrzi+19uNzlRv8mPgo2WC099qnyJU6SwqAVwsvuXN+nN6gWYIpCr/xGT/ufq8Ce9NQjahDolknTo=
X-Received: by 2002:a05:6830:208a:: with SMTP id y10mr3557767otq.293.1557577721944;
 Sat, 11 May 2019 05:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190430124626.GA11138@redhat.com> <CAMRbyytny=8nC1LevEBwYN9cbuzJwG_HjdN5QQsXR-+ROy-MpA@mail.gmail.com>
 <20190511110356.GN9582@redhat.com>
In-Reply-To: <20190511110356.GN9582@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sat, 11 May 2019 15:28:28 +0300
Message-ID: <CAMRbyyt+1y+E5=oT6ZS1iRwXG+wUvHh0ZKR+3ANAX1GsYHdPpg@mail.gmail.com>
Subject: Re: Requirements for an NBD client library in userspace
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>, mkletzan@redhat.com
Content-Type: multipart/alternative; boundary="000000000000d3bd0205889bd2ca"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zva2YG9HXMI.A.MhD.JAs1cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/493
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyt+1y+E5=oT6ZS1iRwXG+wUvHh0ZKR+3ANAX1GsYHdPpg@mail.gmail.com
Resent-Date: Sat, 11 May 2019 12:28:57 +0000 (UTC)

--000000000000d3bd0205889bd2ca
Content-Type: text/plain; charset="UTF-8"

On Sat, May 11, 2019, 14:03 Richard W.M. Jones <rjones@redhat.com> wrote:

> On Tue, Apr 30, 2019 at 04:43:03PM +0300, Nir Soffer wrote:
> > On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones <rjones@redhat.com>
> wrote:
> >
> > > I believe there is no simple NBD client library.  Am I wrong about
> > > this?  Let's assume I'm not for the sake of the rest of this email ...
> > >
> > > We do however have at least 4 places this could be consumed if it
> existed:
> > >
> > >  - fio's proposed NBD engine
> > >    https://www.spinics.net/lists/fio/msg07831.html
> > >
> > >  - nbdkit-nbd-plugin
> > >    https://github.com/libguestfs/nbdkit/tree/master/plugins/nbd
> > >
> > >  - Martin K's forthcoming VMware liberation tool
> > >
> > >  - qemu, maybe?
> > >    https://github.com/qemu/qemu/blob/master/block/nbd-client.c
> >
> >
> > oVirt imageio, replacing pure python client, used to implement nbd-http
> > proxy
> >
> https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_imageio_common/nbd.py
>
> It looks like imageio is Python 2.  I'm trying to write libnbd
> bindings for Python now, but TBH supporting Python 2 is turning out to
> be painful, because there are plenty of Python 3 features it would be
> nice to use ("b" boolean conversions, proper bytes handling and
> PyUnicode_FSConverter are three particular features).  Do you really
> need Python 2?  What is the roadmap for using Python 3 with imageio?
>

We plan to drop python 2 for 4.4. I don't that anyone care about python 2
now.


> Rich.
>
> >
> > > In this email I'm trying to assemble some requirements for such a
> > > library, and I've also attempted to categorize them according to how
> > > difficult they might be to implement.  I guess everyone will have
> > > their own opinions on which features are most "required" and which are
> > > optional, but I've added mine below too.
> > >
> > > Did I miss out anything?
> > >
> > > 1 = easy to implement  ...  5 = hard to implement
> > > |
> > > | R* = required, library could not be used without it
> > > | R  = required
> > > | O+ = optional, but very useful for many users
> > > | O  = optional
> > > | O- = optional, not likely to be useful for many users
> > > | |
> > > v v
> > >
> > > 1 R*   Library which runs in userspace, callable from C programs
> > >
> > > 3 O+   Callable from other programming languages, eg Python etc.
> > >
> > > 1 R*   Connect to Unix domain socket
> > >
> > > 1 R*   Connect to TCP port
> > >
> > > 1 R    Connect to TCP port over IPv6
> > >
> > > 1 O-   Connect to arbitrary file descriptor [eg. for nbdkit -s]
> > >
> > > 2 R    Synchronous support for easy initial use
> > >
> > > 5 O+   Non-blocking/asynch support, use with select/poll
> > >
> > > 4 O+   Integrates with external main loops, glib2, APR pollset, etc.
> > >
> > > 4 O    TLS support using X.509 certs
> > >
> > > 4 O    TLS-PSK support
> > >
> > > 5 O    NBD MULTI_CONN
> > >
> > > 5 O    NBD out of order requests on single socket
> > >
> > > 2 O-   Old-style protocol
> > >
> > > 3 R    NBD_OPT_INFO mode [required for qemu]
> > >
> > > 5 O    NBD structured replies
> > >
> >
> > Should be O+, this gives huge performance improvment when reading mostly
> > empty range, even without block status.
> >
> > This is also not so hard to implement, maybe 3?
> >
> >
> > > 3 O+   NBD block status querying
> > >
> >
> > Should be able to query qemu meta context
> >
> >
> > > ? ?    NBD resize extension
> > >
> >
> > Nir
>
> --
> Richard Jones, Virtualization Group, Red Hat
> http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> Fedora Windows cross-compiler. Compile Windows programs, test, and
> build Windows installers. Over 100 libraries supported.
> http://fedoraproject.org/wiki/MinGW
>

--000000000000d3bd0205889bd2ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, May 11, 2019, 14:03 Richard W.M. Jones &lt;<a =
href=3D"mailto:rjones@redhat.com">rjones@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Tue, Apr 30, 2019 at 04:43:03PM +0300, N=
ir Soffer wrote:<br>
&gt; On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones &lt;<a href=3D"mailto:r=
jones@redhat.com" target=3D"_blank" rel=3D"noreferrer">rjones@redhat.com</a=
>&gt; wrote:<br>
&gt; <br>
&gt; &gt; I believe there is no simple NBD client library.=C2=A0 Am I wrong=
 about<br>
&gt; &gt; this?=C2=A0 Let&#39;s assume I&#39;m not for the sake of the rest=
 of this email ...<br>
&gt; &gt;<br>
&gt; &gt; We do however have at least 4 places this could be consumed if it=
 existed:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - fio&#39;s proposed NBD engine<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://www.spinics.net/lists/fio/msg0783=
1.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.spinics=
.net/lists/fio/msg07831.html</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - nbdkit-nbd-plugin<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/libguestfs/nbdkit/tree=
/master/plugins/nbd" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/libguestfs/nbdkit/tree/master/plugins/nbd</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - Martin K&#39;s forthcoming VMware liberation tool<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - qemu, maybe?<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/qemu/qemu/blob/master/=
block/nbd-client.c" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/qemu/qemu/blob/master/block/nbd-client.c</a><br>
&gt; <br>
&gt; <br>
&gt; oVirt imageio, replacing pure python client, used to implement nbd-htt=
p<br>
&gt; proxy<br>
&gt; <a href=3D"https://github.com/oVirt/ovirt-imageio/blob/master/common/o=
virt_imageio_common/nbd.py" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_imageio_co=
mmon/nbd.py</a><br>
<br>
It looks like imageio is Python 2.=C2=A0 I&#39;m trying to write libnbd<br>
bindings for Python now, but TBH supporting Python 2 is turning out to<br>
be painful, because there are plenty of Python 3 features it would be<br>
nice to use (&quot;b&quot; boolean conversions, proper bytes handling and<b=
r>
PyUnicode_FSConverter are three particular features).=C2=A0 Do you really<b=
r>
need Python 2?=C2=A0 What is the roadmap for using Python 3 with imageio?<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">We=
 plan to drop python 2 for 4.4. I don&#39;t that anyone care about python 2=
 now.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Rich.<br>
<br>
&gt; <br>
&gt; &gt; In this email I&#39;m trying to assemble some requirements for su=
ch a<br>
&gt; &gt; library, and I&#39;ve also attempted to categorize them according=
 to how<br>
&gt; &gt; difficult they might be to implement.=C2=A0 I guess everyone will=
 have<br>
&gt; &gt; their own opinions on which features are most &quot;required&quot=
; and which are<br>
&gt; &gt; optional, but I&#39;ve added mine below too.<br>
&gt; &gt;<br>
&gt; &gt; Did I miss out anything?<br>
&gt; &gt;<br>
&gt; &gt; 1 =3D easy to implement=C2=A0 ...=C2=A0 5 =3D hard to implement<b=
r>
&gt; &gt; |<br>
&gt; &gt; | R* =3D required, library could not be used without it<br>
&gt; &gt; | R=C2=A0 =3D required<br>
&gt; &gt; | O+ =3D optional, but very useful for many users<br>
&gt; &gt; | O=C2=A0 =3D optional<br>
&gt; &gt; | O- =3D optional, not likely to be useful for many users<br>
&gt; &gt; | |<br>
&gt; &gt; v v<br>
&gt; &gt;<br>
&gt; &gt; 1 R*=C2=A0 =C2=A0Library which runs in userspace, callable from C=
 programs<br>
&gt; &gt;<br>
&gt; &gt; 3 O+=C2=A0 =C2=A0Callable from other programming languages, eg Py=
thon etc.<br>
&gt; &gt;<br>
&gt; &gt; 1 R*=C2=A0 =C2=A0Connect to Unix domain socket<br>
&gt; &gt;<br>
&gt; &gt; 1 R*=C2=A0 =C2=A0Connect to TCP port<br>
&gt; &gt;<br>
&gt; &gt; 1 R=C2=A0 =C2=A0 Connect to TCP port over IPv6<br>
&gt; &gt;<br>
&gt; &gt; 1 O-=C2=A0 =C2=A0Connect to arbitrary file descriptor [eg. for nb=
dkit -s]<br>
&gt; &gt;<br>
&gt; &gt; 2 R=C2=A0 =C2=A0 Synchronous support for easy initial use<br>
&gt; &gt;<br>
&gt; &gt; 5 O+=C2=A0 =C2=A0Non-blocking/asynch support, use with select/pol=
l<br>
&gt; &gt;<br>
&gt; &gt; 4 O+=C2=A0 =C2=A0Integrates with external main loops, glib2, APR =
pollset, etc.<br>
&gt; &gt;<br>
&gt; &gt; 4 O=C2=A0 =C2=A0 TLS support using X.509 certs<br>
&gt; &gt;<br>
&gt; &gt; 4 O=C2=A0 =C2=A0 TLS-PSK support<br>
&gt; &gt;<br>
&gt; &gt; 5 O=C2=A0 =C2=A0 NBD MULTI_CONN<br>
&gt; &gt;<br>
&gt; &gt; 5 O=C2=A0 =C2=A0 NBD out of order requests on single socket<br>
&gt; &gt;<br>
&gt; &gt; 2 O-=C2=A0 =C2=A0Old-style protocol<br>
&gt; &gt;<br>
&gt; &gt; 3 R=C2=A0 =C2=A0 NBD_OPT_INFO mode [required for qemu]<br>
&gt; &gt;<br>
&gt; &gt; 5 O=C2=A0 =C2=A0 NBD structured replies<br>
&gt; &gt;<br>
&gt; <br>
&gt; Should be O+, this gives huge performance improvment when reading most=
ly<br>
&gt; empty range, even without block status.<br>
&gt; <br>
&gt; This is also not so hard to implement, maybe 3?<br>
&gt; <br>
&gt; <br>
&gt; &gt; 3 O+=C2=A0 =C2=A0NBD block status querying<br>
&gt; &gt;<br>
&gt; <br>
&gt; Should be able to query qemu meta context<br>
&gt; <br>
&gt; <br>
&gt; &gt; ? ?=C2=A0 =C2=A0 NBD resize extension<br>
&gt; &gt;<br>
&gt; <br>
&gt; Nir<br>
<br>
-- <br>
Richard Jones, Virtualization Group, Red Hat <a href=3D"http://people.redha=
t.com/~rjones" rel=3D"noreferrer noreferrer" target=3D"_blank">http://peopl=
e.redhat.com/~rjones</a><br>
Read my programming and virtualization blog: <a href=3D"http://rwmj.wordpre=
ss.com" rel=3D"noreferrer noreferrer" target=3D"_blank">http://rwmj.wordpre=
ss.com</a><br>
Fedora Windows cross-compiler. Compile Windows programs, test, and<br>
build Windows installers. Over 100 libraries supported.<br>
<a href=3D"http://fedoraproject.org/wiki/MinGW" rel=3D"noreferrer noreferre=
r" target=3D"_blank">http://fedoraproject.org/wiki/MinGW</a><br>
</blockquote></div></div></div>

--000000000000d3bd0205889bd2ca--

