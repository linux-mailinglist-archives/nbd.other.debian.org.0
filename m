Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A133E260A5
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 11:44:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6FA98204D2; Wed, 22 May 2019 09:44:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 09:44:31 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E261120431
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 09:44:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, HTML_MESSAGE=2,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id G4yjZByumWAT for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 09:44:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .mail-oi1-f170.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2979520623
	for <nbd@other.debian.org>; Wed, 22 May 2019 09:44:18 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 203so1078242oid.13
        for <nbd@other.debian.org>; Wed, 22 May 2019 02:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NwHderD/tONx5UtxUjx0XZzitFGASxMrtFEE1zFSveM=;
        b=F8oQeAH1l4GoBH4v/fFUm0OiElGqnnl7upy3SVUEtZucFN1C2SA63/8sEyqW0qwx6h
         acSqY5RZJFy34xIGK2Ja7Z0F3Z8oHLuuuv0iuT345RZzJN/LikyEh+E4ipKMkajqiWsg
         Bm6y9Phlb71YEUXv+Nt34wuneozXSNiZePlmKxAcA8coN6/P33RCwukicZDe4TogiCMM
         VRsa9ao6XBeV12XY+pTH5x8hJhpDYSYvKNJwj423fexez+SRKHrtDkGgBlaYEFDdWxE9
         0rsZDTQgFP8lWaSQJoxb0y4nHif5cXKpXKns1BPz6HE/VOHHjxdq1q0MT6+sYQ3muChO
         XF9w==
X-Gm-Message-State: APjAAAVyS0CTD0Ogii4Exy4/CBoMFmBoP7FVdpfzq2h9t+uBpSR7K731
	IYdDOrWlcyEJ11eCuiDuOFzfPe8CrYcJEr1gMy4DCg==
X-Google-Smtp-Source: APXvYqx1qO0yv10bAJsvS8VNbk8vG/wqmC5chGiIYjBtnACyuHuUlH7Tn6gHN4vdj9lS1w0G9n1g37WKIvqAK9OhKk0=
X-Received: by 2002:aca:f582:: with SMTP id t124mr6970039oih.56.1558518254945;
 Wed, 22 May 2019 02:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190520092056.GA9368@redhat.com> <81150a0a-11ce-c0e9-179d-7ff865586fb8@redhat.com>
In-Reply-To: <81150a0a-11ce-c0e9-179d-7ff865586fb8@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 22 May 2019 12:44:00 +0300
Message-ID: <CAMRbyyt4-c44EyvDFMu2qP_vcXYmjsxJ1YRGYyia_TNFYWPnWA@mail.gmail.com>
Subject: Re: Standard NBD URL syntax (again)
To: Eric Blake <eblake@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org, 
	"Daniel P. Berrange" <berrange@redhat.com>, Wouter Verhelst <w@uter.be>
Content-Type: multipart/alternative; boundary="000000000000f66710058976ce03"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H3Qh4oGaL8O.A.DyG._nR5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/508
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyt4-c44EyvDFMu2qP_vcXYmjsxJ1YRGYyia_TNFYWPnWA@mail.gmail.com
Resent-Date: Wed, 22 May 2019 09:44:31 +0000 (UTC)

--000000000000f66710058976ce03
Content-Type: text/plain; charset="UTF-8"

On Mon, May 20, 2019 at 4:42 PM Eric Blake <eblake@redhat.com> wrote:

> On 5/20/19 4:20 AM, Richard W.M. Jones wrote:
> >
> > Previous discussion:
> > https://lists.debian.org/nbd/2018/07/msg00002.html
> >
> > Again I'm stuck because we need a URL syntax for NBD.
> >
> > Various URLs have been proposed before:
> >
> >   * Library      Hostname+port over TCP/IP
> >                  Unix domain socket
> >                Export name
> >   - Link for further information
> >   - Notes
> >
> >   * libguestfs   nbd://example.com:port      (:port is optional)
> >                  nbd://?socket=/socket
> >                nbd://example.com:port/exportname
> >                  nbd:///exportname?socket=/socket
> >   - http://libguestfs.org/guestfish.1.html#a-nbd:-example.com-:port
> >   - Cannot specify an export name without a leading '/' character
> >
> >   * QEMU         nbd:example.com:port
> >                  nbd:unix:/socket
> >                nbd:example.com:port:exportname=/export
> >   - https://qemu.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax
> >   - Not a real URL!
>
> Qemu also supports actual URLs:
>
> nbd[+tcp]://example.com[:port]/[exportname]
> nbd+unix:///[exportname]?socket=path


> where the [...] blocks are optional (missing exportname requests the
> default '' export, missing port defaults to 10809)
>
> >
> >   * Curl         nbd://example.com/
> >                  nbd://example.com/exportname
> >   -
> https://github.com/rwmjones/curl/commit/2aba3dd7d8f9b8e03a8c3435e7555ab9e195675a#diff-77ab3188c0ad08b7b9d8d9787c8e9d75
> >   - Cannot specify an export name without a leading '/' character
> >   - No Unix domain socket syntax was ever defined.
> >   - Did not go upstream.
> >
> > The leading problem with the "obvious" NBD URL format seems to be that
> > it's impossible to specify empty export names or export names which
> > don't start with a '/' character.
>
> The qemu format allows empty export names. 'nbd://hostname' and
> 'nbd://hostname/' are the same empty export, 'nbd://hostname//' is the
> export named '/'.
>
> >
> > This is why I'd be inclined to use an extra URL parameter instead,
> > like:
> >
> >   nbd://example.com[:port]/?export=exportname
> >
> > and for Unix domain sockets:
> >
> >   nbd:///?export=exportname&socket=/socket
>
> The qemu solution was to use the 'nbd+unix://' protocol rather than the
> bare 'nbd://' protocol to tell the difference between tcp and Unix
> sockets, rather than trying to figure out from the rest of the URL which
> context was implied.
>

The qemu solution is consistent , flexible and easy to use and does not
require
any policy on the server (stripping leading /).

I think we should adapt it for the NBD spec.

I wonder why this syntax is not documented in:
https://qemu.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax

>
> > The export would be optional, defaulting to empty string.  IPv6
> > addresses would work in the obvious way for URLs, using "[...]"
> > around the address part (ie as in RFC 2732).  All escaping issues
> > would work as for standard URLs.
> >
> > I think we should standardize this once and for all in a document in
> > the NBD repository.
> >
> > Anyway let me know what you think and I will try to write something
> > formal.
> >
> > Rich.
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>
>

--000000000000f66710058976ce03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:#000000"><span style=3D"color:rgb(34,34,34)">On Mon, May=
 20, 2019 at 4:42 PM Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com">eb=
lake@redhat.com</a>&gt; wrote:</span><br></div></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/20/19 4:20 AM, =
Richard W.M. Jones wrote:<br>
&gt; <br>
&gt; Previous discussion:<br>
&gt; <a href=3D"https://lists.debian.org/nbd/2018/07/msg00002.html" rel=3D"=
noreferrer" target=3D"_blank">https://lists.debian.org/nbd/2018/07/msg00002=
.html</a><br>
&gt; <br>
&gt; Again I&#39;m stuck because we need a URL syntax for NBD.<br>
&gt; <br>
&gt; Various URLs have been proposed before:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Library=C2=A0 =C2=A0 =C2=A0 Hostname+port over TCP/IP<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Unix dom=
ain socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Export name<br>
&gt;=C2=A0 =C2=A0- Link for further information<br>
&gt;=C2=A0 =C2=A0- Notes<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* libguestfs=C2=A0 =C2=A0nbd://example.com:port=C2=A0 =C2=
=A0 =C2=A0 (:port is optional)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nbd://?s=
ocket=3D/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nbd://example.c=
om:port/exportname<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nbd:///e=
xportname?socket=3D/socket<br>
&gt;=C2=A0 =C2=A0- <a href=3D"http://libguestfs.org/guestfish.1.html#a-nbd:=
-example.com-:port" rel=3D"noreferrer" target=3D"_blank">http://libguestfs.=
org/guestfish.1.html#a-nbd:-example.com-:port</a><br>
&gt;=C2=A0 =C2=A0- Cannot specify an export name without a leading &#39;/&#=
39; character<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* QEMU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd:example.com:po=
rt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nbd:unix=
:/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nbd:example.com=
:port:exportname=3D/export<br>
&gt;=C2=A0 =C2=A0- <a href=3D"https://qemu.weilnetz.de/doc/qemu-doc.html#De=
vice-URL-Syntax" rel=3D"noreferrer" target=3D"_blank"><span class=3D"gmail_=
default" style=3D"font-size:small;color:rgb(0,0,0)"></span><span class=3D"g=
mail_default" style=3D"font-size:small;color:rgb(0,0,0)"></span>https://qem=
u.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax</a><br>
&gt;=C2=A0 =C2=A0- Not a real URL!<br>
<br>
Qemu also supports actual URLs:<br>
<br>
nbd[+tcp]://<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_bl=
ank">example.com</a>[:port]/[exportname]<br>
nbd+unix:///[exportname]?socket=3Dpath<span style=3D"color:rgb(0,0,0)"></sp=
an></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
where the [...] blocks are optional (missing exportname requests the<br>
default &#39;&#39; export, missing port defaults to 10809)<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Curl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd://<a href=3D"h=
ttp://example.com/" rel=3D"noreferrer" target=3D"_blank">example.com/</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nbd://<a=
 href=3D"http://example.com/exportname" rel=3D"noreferrer" target=3D"_blank=
">example.com/exportname</a><br>
&gt;=C2=A0 =C2=A0- <a href=3D"https://github.com/rwmjones/curl/commit/2aba3=
dd7d8f9b8e03a8c3435e7555ab9e195675a#diff-77ab3188c0ad08b7b9d8d9787c8e9d75" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/rwmjones/curl/commi=
t/2aba3dd7d8f9b8e03a8c3435e7555ab9e195675a#diff-77ab3188c0ad08b7b9d8d9787c8=
e9d75</a><br>
&gt;=C2=A0 =C2=A0- Cannot specify an export name without a leading &#39;/&#=
39; character<br>
&gt;=C2=A0 =C2=A0- No Unix domain socket syntax was ever defined.<br>
&gt;=C2=A0 =C2=A0- Did not go upstream.<br>
&gt; <br>
&gt; The leading problem with the &quot;obvious&quot; NBD URL format seems =
to be that<br>
&gt; it&#39;s impossible to specify empty export names or export names whic=
h<br>
&gt; don&#39;t start with a &#39;/&#39; character.<br>
<br>
The qemu format allows empty export names. &#39;nbd://hostname&#39; and<br>
&#39;nbd://hostname/&#39; are the same empty export, &#39;nbd://hostname//&=
#39; is the<br>
export named &#39;/&#39;.<br>
<br>
&gt; <br>
&gt; This is why I&#39;d be inclined to use an extra URL parameter instead,=
<br>
&gt; like:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0nbd://<a href=3D"http://example.com" rel=3D"noreferrer" ta=
rget=3D"_blank">example.com</a>[:port]/?export=3Dexportname<br>
&gt; <br>
&gt; and for Unix domain sockets:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0nbd:///?export=3Dexportname&amp;socket=3D/socket<br>
<br>
The qemu solution was to use the &#39;nbd+unix://&#39; protocol rather than=
 the<br>
bare &#39;nbd://&#39; protocol to tell the difference between tcp and Unix<=
br>
sockets, rather than trying to figure out from the rest of the URL which<br=
>
context was implied.<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small;color:rgb(0,0,0)">The qemu solution is =
consistent , flexible and easy to use and does not require</div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">any policy on=
 the server (stripping leading /).</div><div class=3D"gmail_default" style=
=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small;color:rgb(0,0,0)">I think we should adapt it for=
 the NBD spec.</div></div><div class=3D"gmail_default" style=3D"font-size:s=
mall;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small;color:rgb(0,0,0)">I wonder why this syntax is not documented in=
:</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,=
0)"><a href=3D"https://qemu.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax=
" rel=3D"noreferrer" target=3D"_blank"><span class=3D"gmail_default" style=
=3D"color:rgb(0,0,0)"></span>https://qemu.weilnetz.de/doc/qemu-doc.html#Dev=
ice-URL-Syntax</a><br></div><div class=3D"gmail_default" style=3D"font-size=
:small;color:rgb(0,0,0)"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; <br>
&gt; The export would be optional, defaulting to empty string.=C2=A0 IPv6<b=
r>
&gt; addresses would work in the obvious way for URLs, using &quot;[...]&qu=
ot;<br>
&gt; around the address part (ie as in RFC 2732).=C2=A0 All escaping issues=
<br>
&gt; would work as for standard URLs.<br>
&gt; <br>
&gt; I think we should standardize this once and for all in a document in<b=
r>
&gt; the NBD repository.<br>
&gt; <br>
&gt; Anyway let me know what you think and I will try to write something<br=
>
&gt; formal.<br>
&gt; <br>
&gt; Rich.<br>
&gt; <br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3226<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div>

--000000000000f66710058976ce03--

