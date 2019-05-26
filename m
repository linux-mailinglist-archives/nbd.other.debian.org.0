Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0B2A952
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 13:06:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2548E2049D; Sun, 26 May 2019 11:06:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 11:06:23 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D306C204A0
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 11:06:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, HTML_MESSAGE=2,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HLzP97hJOn59 for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 11:06:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .mail-oi1-f195.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8745020378
	for <nbd@other.debian.org>; Sun, 26 May 2019 11:06:07 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id u64so10056295oib.1
        for <nbd@other.debian.org>; Sun, 26 May 2019 04:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=faBVRR3PRc0zCZ9wdRbnXQrz9YOVbX2YI4TS6gYxvK4=;
        b=dXRA4S0h7TRry8b3fGibe1rA+Qsd8JUdVzh3ekYDpY/CZq1+VQy2sb0ZCkH6Ck0MTD
         jOUcZ59XJFvMGDfwzxn6oC5Td7wu/rtr2ZJbf6Zm9M1Pxoo3rFx9+alZfm36SstAUjDB
         vRPK37YCJSIzKZOSwQBKjO8HnO/vaOhUnLtLDQ3uRgdW6/MfvMWS55ndq2mYx5dXZome
         5VWGypEkH8+NRxJJIGjdtk80Qx4C68X1zpSimEf5FY6tCzKcdE+jIn+0+ZeRKLLv8OwP
         K8Vbn5dEX0TlXJNpdEdY7uvEiDT5fxnLWm+E6WEWJxVfFYNRo90bPnpdo3E0pK0ybnl0
         nqkw==
X-Gm-Message-State: APjAAAUzGhs70/ZNk818fpxKeEC/aJNyejclux0t0UVNUjsIZLoVl8GY
	qbDAcVtrn5KdLgWK43vQdFJhrgXWD+dGT+UGaPF7Rg==
X-Google-Smtp-Source: APXvYqxPrTkdvNrAm9kTv0seDAJy4OmHuvkcttqQcAlLPKxd1+YhPTY5pyzT/WHVB16MYNr3XzdMBgk6LKcNIkWTiCc=
X-Received: by 2002:aca:de44:: with SMTP id v65mr10940273oig.135.1558868764261;
 Sun, 26 May 2019 04:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190525170518.4799-1-rjones@redhat.com> <20190526081532.GA6936@grep.be>
 <20190526090018.GO9582@redhat.com> <20190526092411.GB9368@redhat.com>
In-Reply-To: <20190526092411.GB9368@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 26 May 2019 14:05:54 +0300
Message-ID: <CAMRbyyt3d9nKpnd6X1zggNnqN_vxjJqg62PhatztH6Nfw7Uvkg@mail.gmail.com>
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD URIs.
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org, Eric Blake <eblake@redhat.com>, 
	"Daniel P. Berrange" <berrange@redhat.com>, Martin Kletzander <mkletzan@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f221df0589c86a13"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qBKt0S7MMvP.A.DiE.vMn6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/527
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyt3d9nKpnd6X1zggNnqN_vxjJqg62PhatztH6Nfw7Uvkg@mail.gmail.com
Resent-Date: Sun, 26 May 2019 11:06:23 +0000 (UTC)

--000000000000f221df0589c86a13
Content-Type: text/plain; charset="UTF-8"

On Sun, May 26, 2019 at 12:24 PM Richard W.M. Jones <rjones@redhat.com>
wrote:

> On Sun, May 26, 2019 at 10:00:18AM +0100, Richard W.M. Jones wrote:
> > I intended to write a cover letter, got distracted while sending it
> > and forgot ...
> >
> > Anyway I was going to say:
> >
> >  - There's no way to specify abstract Unix domain sockets.


Isn't this enough?

    nbd+unix:///export?socket=%00/org/foo

>>> from urllib.parse import urlparse, parse_qs

>>> urlparse("nbd+unix:///export?socket=%00/org/foo")
ParseResult(scheme='nbd+unix', netloc='', path='/export', params='',
query='socket=%00/org/foo', fragment='')

>>> parse_qs('socket=%00/org/foo')
{'socket': ['\x00/org/foo']}

Should
> >    there be?  I'm not aware of any server that supports them.  Luckily
> >    the common approach of using `@` at the beginning should work:
> >
> https://unix.stackexchange.com/questions/206386/what-does-the-symbol-denote-in-the-beginning-of-a-unix-domain-socket-path-in-l
> >
> >  - As Wouter already picked up in his review, should we allow a
> >    default Unix domain socket?  The corollary to this is: Should we
> >    make the authority mandatory for TCP/IP sockets?  Are there
> >    sensible defaults for the authority (localhost:10809 probably).
> >
> >  - I notice that proto.md has a text symlink (proto.txt).  Would we
> >    need one for url.txt -> url.md?
>
> A few more things:
>
>  - I wrote a libnbd implementation of NBD URIs last night:
>
> https://github.com/libguestfs/libnbd/commit/d2dfefcefdf64864acae7a75c30d3f54e9a63ea6
>    Of course thisis based off the draft spec, but I can amend this
>    implementation as we work towards a final spec.  One annoying thing
>    is that libxml2 provides no support for parsing the query
>    parameters, and doing it by hand in C is a PITA ...
>
>  - libnbd supports `nbds+unix` (ie. require TLS over a Unix domain
>    socket).  We use this for testing, and of course it's "useless" for
>    real life, which is why I omitted it from the spec.  (QEMU doesn't
>    support TLS over Unix domain sockets; nbd-server looks like it
>    could support it, but I didn't test it).
>
>  - On the subject of requiring TLS, I made `nbds` mean that TLS is
>    required, while `nbd` means that TLS can be used opportunistically
>    but is not required.  Not sure what people think about that.
>    There's no "definitely don't use TLS" setting, but given we have
>    observed a 10x slowdown when TLS is enabled on a Unix domain socket
>    between libnbd & nbdkit[*] maybe there should be.
>
> Rich.
>
> [*] A slightly unrealistic test.  Most of the time is spent running
> the ChaCha stream cipher, and the cost of that would be mostly hidden
> by network latency if we were doing this over a TCP socket.
>
> --
> Richard Jones, Virtualization Group, Red Hat
> http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v
>

--000000000000f221df0589c86a13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:#000000"><span style=3D"color:rgb(34,34,34)">On Sun, May=
 26, 2019 at 12:24 PM Richard W.M. Jones &lt;<a href=3D"mailto:rjones@redha=
t.com" target=3D"_blank">rjones@redhat.com</a>&gt; wrote:</span><br></div><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, May 26, 2019 at 10:00:18AM +0100, Richard W.M. Jones wrote:<=
br>
&gt; I intended to write a cover letter, got distracted while sending it<br=
>
&gt; and forgot ...<br>
&gt; <br>
&gt; Anyway I was going to say:<br>
&gt; <br>
&gt;=C2=A0 - There&#39;s no way to specify abstract Unix domain sockets.=C2=
=A0 </blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small;color:rgb(0,0,0)">Isn&#39;t this enough?</div><div class=3D=
"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">=C2=A0 =
=C2=A0 nbd+unix:///export?socket=3D%00/org/foo</div><div class=3D"gmail_def=
ault" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small;color:rgb(0,0,0)"></div><div class=3D=
"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span class=3D"g=
mail_default"></span><span style=3D"color:rgb(34,34,34)">&gt;&gt;&gt; from =
urllib.parse import urlparse, parse_qs</span><span style=3D"color:rgb(34,34=
,34)"><br></span></div><div class=3D"gmail_default" style=3D"font-size:smal=
l;color:rgb(0,0,0)"><span style=3D"color:rgb(34,34,34)"><br></span></div><s=
pan class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"></sp=
an>&gt;&gt;&gt; urlparse(&quot;nbd+unix:///export?socket=3D%00/org/foo&quot=
;)<br>ParseResult(scheme=3D&#39;nbd+unix&#39;, netloc=3D&#39;&#39;, path=3D=
&#39;/export&#39;, params=3D&#39;&#39;, query=3D&#39;socket=3D%00/org/foo&#=
39;, fragment=3D&#39;&#39;)<br><br></div><div>&gt;&gt;&gt; parse_qs(&#39;so=
cket=3D%00/org/foo&#39;)<br>{&#39;socket&#39;: [&#39;\x00/org/foo&#39;]}<sp=
an style=3D"color:rgb(0,0,0)"></span></div><div><span style=3D"color:rgb(0,=
0,0)"></span><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sh=
ould<br>
&gt;=C2=A0 =C2=A0 there be?=C2=A0 I&#39;m not aware of any server that supp=
orts them.=C2=A0 Luckily<br>
&gt;=C2=A0 =C2=A0 the common approach of using `@` at the beginning should =
work:<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://unix.stackexchange.com/questions/20638=
6/what-does-the-symbol-denote-in-the-beginning-of-a-unix-domain-socket-path=
-in-l" rel=3D"noreferrer" target=3D"_blank">https://unix.stackexchange.com/=
questions/206386/what-does-the-symbol-denote-in-the-beginning-of-a-unix-dom=
ain-socket-path-in-l</a><br>
&gt; <br>
&gt;=C2=A0 - As Wouter already picked up in his review, should we allow a<b=
r>
&gt;=C2=A0 =C2=A0 default Unix domain socket?=C2=A0 The corollary to this i=
s: Should we<br>
&gt;=C2=A0 =C2=A0 make the authority mandatory for TCP/IP sockets?=C2=A0 Ar=
e there<br>
&gt;=C2=A0 =C2=A0 sensible defaults for the authority (localhost:10809 prob=
ably).<br>
&gt; <br>
&gt;=C2=A0 - I notice that proto.md has a text symlink (proto.txt).=C2=A0 W=
ould we<br>
&gt;=C2=A0 =C2=A0 need one for url.txt -&gt; url.md?<br>
<br>
A few more things:<br>
<br>
=C2=A0- I wrote a libnbd implementation of NBD URIs last night:<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/libguestfs/libnbd/commit/d2dfefc=
efdf64864acae7a75c30d3f54e9a63ea6" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/libguestfs/libnbd/commit/d2dfefcefdf64864acae7a75c30d3f54e9=
a63ea6</a><br>
=C2=A0 =C2=A0Of course thisis based off the draft spec, but I can amend thi=
s<br>
=C2=A0 =C2=A0implementation as we work towards a final spec.=C2=A0 One anno=
ying thing<br>
=C2=A0 =C2=A0is that libxml2 provides no support for parsing the query<br>
=C2=A0 =C2=A0parameters, and doing it by hand in C is a PITA ...<br>
<br>
=C2=A0- libnbd supports `nbds+unix` (ie. require TLS over a Unix domain<br>
=C2=A0 =C2=A0socket).=C2=A0 We use this for testing, and of course it&#39;s=
 &quot;useless&quot; for<br>
=C2=A0 =C2=A0real life, which is why I omitted it from the spec.=C2=A0 (QEM=
U doesn&#39;t<br>
=C2=A0 =C2=A0support TLS over Unix domain sockets; nbd-server looks like it=
<br>
=C2=A0 =C2=A0could support it, but I didn&#39;t test it).<br>
<br>
=C2=A0- On the subject of requiring TLS, I made `nbds` mean that TLS is<br>
=C2=A0 =C2=A0required, while `nbd` means that TLS can be used opportunistic=
ally<br>
=C2=A0 =C2=A0but is not required.=C2=A0 Not sure what people think about th=
at.<br>
=C2=A0 =C2=A0There&#39;s no &quot;definitely don&#39;t use TLS&quot; settin=
g, but given we have<br>
=C2=A0 =C2=A0observed a 10x slowdown when TLS is enabled on a Unix domain s=
ocket<br>
=C2=A0 =C2=A0between libnbd &amp; nbdkit[*] maybe there should be.<br>
<br>
Rich.<br>
<br>
[*] A slightly unrealistic test.=C2=A0 Most of the time is spent running<br=
>
the ChaCha stream cipher, and the cost of that would be mostly hidden<br>
by network latency if we were doing this over a TCP socket.<br>
<br>
-- <br>
Richard Jones, Virtualization Group, Red Hat <a href=3D"http://people.redha=
t.com/~rjones" rel=3D"noreferrer" target=3D"_blank">http://people.redhat.co=
m/~rjones</a><br>
Read my programming and virtualization blog: <a href=3D"http://rwmj.wordpre=
ss.com" rel=3D"noreferrer" target=3D"_blank">http://rwmj.wordpress.com</a><=
br>
virt-p2v converts physical machines to virtual machines.=C2=A0 Boot with a<=
br>
live CD or over the network (PXE) and turn machines into KVM guests.<br>
<a href=3D"http://libguestfs.org/virt-v2v" rel=3D"noreferrer" target=3D"_bl=
ank">http://libguestfs.org/virt-v2v</a><br>
</blockquote></div></div>

--000000000000f221df0589c86a13--

