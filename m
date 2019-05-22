Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4F25EBB
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 09:38:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C12E82060F; Wed, 22 May 2019 07:38:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 07:38:22 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=4.0 tests=HTML_MESSAGE,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5DAFE205D9
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 07:38:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.999 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, HTML_MESSAGE=2, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001, WEIRD_PORT=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NZA4TNEtqPcN for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 07:38:10 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .mail-ot1-f48.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 99FE920600
	for <nbd@other.debian.org>; Wed, 22 May 2019 07:38:10 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id c3so1210627otr.3
        for <nbd@other.debian.org>; Wed, 22 May 2019 00:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3VTsSHbwpo4BT/5RIh8UERJ2D4UyEL8pe5u+qsZUcus=;
        b=SiHAMfCXnt9KTwiFQlxRGkQz+LWPFET4KnZ05FMchoyfXnOUKaNKUHipee2K8Rvvb+
         c3XZxn3sDdNR1zlT0kAzG6GIr9kTII0EDWYMhlRzXuJcwbWpAPaF2GzCHT+IEAynLvR0
         P7TMSbtGU9uBDuaHLSYd3jlL21rjzj/Mxc1wnhwkdx4Q6MLLekZPzvdA451rFdk3vnH8
         gjGHQXADWcz8vfVyJkMZiNwErcPNKbpuRCBuYQffvqpw/80Yy1+DU/3qUnoJt+aVkN1y
         D+V6dMcteKW5c6bmrrnZq1oYH/w3gJmUJjeGlBTJJqRYSdaA6+q5dGXyaPYHE8f7R3Io
         1AtA==
X-Gm-Message-State: APjAAAXyga1ZR5fwRwaZCEYMRHeoTMElvPcVYEVLPYf4+VMSnzSzPo/z
	AGCdJoJvEm3FilwELpSxyT2Kt1tvNzPBOW2me+v/+w==
X-Google-Smtp-Source: APXvYqy1XYrNuqq/vcU418Za6ILq+bPEWXsgrLbP4PCVElLuwNP/o16Ja3XT8aYJ/Xcah7r+4X+sf12L87EobDyIaCk=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr40236534otb.81.1558510686818;
 Wed, 22 May 2019 00:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190520092056.GA9368@redhat.com> <20190521203036.GA24332@grep.be>
 <20190521212701.GS9582@redhat.com> <20190522064220.GB24332@grep.be>
In-Reply-To: <20190522064220.GB24332@grep.be>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 22 May 2019 10:37:54 +0300
Message-ID: <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
Subject: Re: Standard NBD URL syntax (again)
To: Wouter Verhelst <w@uter.be>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org, 
	"Daniel P. Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ddf2f90589750b39"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y1d0i2O7XqJ.A.FGC.uxP5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/506
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com
Resent-Date: Wed, 22 May 2019 07:38:22 +0000 (UTC)

--000000000000ddf2f90589750b39
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 9:42 AM Wouter Verhelst <w@uter.be> wrote:

> On Tue, May 21, 2019 at 10:27:01PM +0100, Richard W.M. Jones wrote:
> > On Tue, May 21, 2019 at 10:30:36PM +0200, Wouter Verhelst wrote:
> > > On Mon, May 20, 2019 at 10:20:56AM +0100, Richard W.M. Jones wrote:
> > > > The leading problem with the "obvious" NBD URL format seems to be
> that
> > > > it's impossible to specify empty export names or export names which
> > > > don't start with a '/' character.
> > >
> > > Not sure? We can just define the / as a separator character, rather
> than
> > > as part of the name. That would then result in:
> > >
> > > nbd://nbd-server.example.com:12345/foo
> > >
> > > for "the export called 'foo' at nbd-server.example.com on port 12345"
> > >
> > > nbd://nbd-server.example.com//foo
> > >
> > > for "the export called '/foo' at nbd-server.example.com on the default
> > > port"
> >
> > This is what qemu uses, but it does seem a little awkward?  It would
> > be easy to make the naive assumption that given an export called
> > "/foo" you'd write the URL "nbd://server/foo".
>
> That really depends on how you interpret the / character, but yeah,
> that's possible. We'll just have to make sure to document that well,
> then.
>

The value of using a URL is user being able to use existing URL parsers.

>>> from urllib.parse import urlparse
>>> urlparse("nbd://nbd-server.example.com:12345/foo")
ParseResult(scheme='nbd', netloc='nbd-server.example.com:12345',
path='/foo', params='', query='', fragment='')
>>> urlparse("nbd://nbd-server.example.com:12345//foo")
ParseResult(scheme='nbd', netloc='nbd-server.example.com:12345',
path='//foo', params='', query='', fragment='')

So users will mostly likely use //path when accessing the server with the
second URL.

Multiple separator are typically normalized to single one, both in web
applications
and when accessing the file system:

    >>> os.path.samefile("/tmp/file", "/tmp///file")
    True

Same behavior with:

    ls /tmp/file
    ls /tmp//file

I think that the way to think about it is that export names are always
relative to the server root, so

    nbd://nbd-server.example.com:12345/foo

maps to the export name "foo" and "/foo".

And both:

    nbd://nbd-server.example.com:12345/
    nbd://nbd-server.example.com:12345

mapped to the empty export name.
Nir

--000000000000ddf2f90589750b39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:#000000"><span style=3D"color:rgb(34,34,34)">On Wed, May=
 22, 2019 at 9:42 AM Wouter Verhelst &lt;<a href=3D"mailto:w@uter.be">w@ute=
r.be</a>&gt; wrote:</span><br></div></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, May 21, 2019 at 10:27:0=
1PM +0100, Richard W.M. Jones wrote:<br>
&gt; On Tue, May 21, 2019 at 10:30:36PM +0200, Wouter Verhelst wrote:<br>
&gt; &gt; On Mon, May 20, 2019 at 10:20:56AM +0100, Richard W.M. Jones wrot=
e:<br>
&gt; &gt; &gt; The leading problem with the &quot;obvious&quot; NBD URL for=
mat seems to be that<br>
&gt; &gt; &gt; it&#39;s impossible to specify empty export names or export =
names which<br>
&gt; &gt; &gt; don&#39;t start with a &#39;/&#39; character.<br>
&gt; &gt; <br>
&gt; &gt; Not sure? We can just define the / as a separator character, rath=
er than<br>
&gt; &gt; as part of the name. That would then result in:<br>
&gt; &gt; <br>
&gt; &gt; nbd://<a href=3D"http://nbd-server.example.com:12345/foo" rel=3D"=
noreferrer" target=3D"_blank">nbd-server.example.com:12345/foo</a><br>
&gt; &gt; <br>
&gt; &gt; for &quot;the export called &#39;foo&#39; at <a href=3D"http://nb=
d-server.example.com" rel=3D"noreferrer" target=3D"_blank">nbd-server.examp=
le.com</a> on port 12345&quot;<br>
&gt; &gt; <br>
&gt; &gt; nbd://<a href=3D"http://nbd-server.example.com//foo" rel=3D"noref=
errer" target=3D"_blank">nbd-server.example.com//foo</a><br>
&gt; &gt; <br>
&gt; &gt; for &quot;the export called &#39;/foo&#39; at <a href=3D"http://n=
bd-server.example.com" rel=3D"noreferrer" target=3D"_blank">nbd-server.exam=
ple.com</a> on the default<br>
&gt; &gt; port&quot;<br>
&gt; <br>
&gt; This is what qemu uses, but it does seem a little awkward?=C2=A0 It wo=
uld<br>
&gt; be easy to make the naive assumption that given an export called<br>
&gt; &quot;/foo&quot; you&#39;d write the URL &quot;nbd://server/foo&quot;.=
<br>
<br>
That really depends on how you interpret the / character, but yeah,<br>
that&#39;s possible. We&#39;ll just have to make sure to document that well=
,<br>
then.<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small;color:rgb(0,0,0)">The value of using a URL is user bei=
ng able to use existing URL parsers.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small;color:rgb(0,0,0)"><br></div>&gt;&gt;&gt; from urllib.p=
arse import urlparse<br>&gt;&gt;&gt; urlparse(&quot;<span class=3D"gmail_de=
fault" style=3D"font-size:small;color:rgb(0,0,0)"></span>nbd://<a href=3D"h=
ttp://nbd-server.example.com:12345/foo">nbd-server.example.com:12345/foo</a=
>&quot;)<br>ParseResult(scheme=3D&#39;nbd&#39;, netloc=3D&#39;<a href=3D"ht=
tp://nbd-server.example.com:12345">nbd-server.example.com:12345</a>&#39;, p=
ath=3D&#39;/foo&#39;, params=3D&#39;&#39;, query=3D&#39;&#39;, fragment=3D&=
#39;&#39;)<br>&gt;&gt;&gt; urlparse(&quot;nbd://<a href=3D"http://nbd-serve=
r.example.com:12345//foo">nbd-server.example.com:12345//foo</a>&quot;)<br>P=
arseResult(scheme=3D&#39;nbd&#39;, netloc=3D&#39;<a href=3D"http://nbd-serv=
er.example.com:12345">nbd-server.example.com:12345</a>&#39;, path=3D&#39;//=
foo&#39;, params=3D&#39;&#39;, query=3D&#39;&#39;, fragment=3D&#39;&#39;)</=
div><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll;color:rgb(0,0,0)">So users will mostly likely use //path when accessing =
the server with the second URL.</div></div><div class=3D"gmail_default" sty=
le=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small;color:rgb(0,0,0)">Multiple separator are typic=
ally normalized to single one, both in web applications</div><div class=3D"=
gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">and when accessin=
g the file system:</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small;color:rgb(0,0,0)">=C2=A0 =C2=A0 &gt;&gt;&gt; os.path.samefile(&qu=
ot;/tmp/file&quot;, &quot;/tmp///file&quot;)<br>=C2=A0 =C2=A0 True<br></div=
><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0=
,0)">Same behavior with:</div><div class=3D"gmail_default" style=3D"font-si=
ze:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small;color:rgb(0,0,0)">=C2=A0 =C2=A0 ls /tmp/file</div><div clas=
s=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">=C2=A0 =C2=
=A0 ls /tmp//file</div><div class=3D"gmail_default" style=3D"font-size:smal=
l;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small;color:rgb(0,0,0)">I think that the way to think about it is that e=
xport names are always</div><div class=3D"gmail_default" style=3D"font-size=
:small;color:rgb(0,0,0)">relative to the server root, so</div><div class=3D=
"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span cla=
ss=3D"gmail_default">=C2=A0 =C2=A0=C2=A0</span><span style=3D"color:rgb(34,=
34,34)">nbd://<a href=3D"http://nbd-server.example.com:12345/foo">nbd-serve=
r.example.com:12345/foo</a></span><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small;color:rgb(0,0,0)"><div class=3D"gmail_default"><br><=
/div></div><div class=3D"gmail_default" style=3D"font-size:small">maps to t=
he export name &quot;foo&quot; and &quot;/foo&quot;.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">And both:</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small"><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"><span =
class=3D"gmail_default">=C2=A0 =C2=A0=C2=A0</span><span style=3D"color:rgb(=
34,34,34)">nbd://<a href=3D"http://nbd-server.example.com:12345/">nbd-serve=
r.example.com:12345/</a></span></div><div class=3D"gmail_default" style=3D"=
color:rgb(0,0,0)"><div class=3D"gmail_default"><span class=3D"gmail_default=
">=C2=A0 =C2=A0=C2=A0</span><span style=3D"color:rgb(34,34,34)">nbd://<a hr=
ef=3D"http://nbd-server.example.com:12345">nbd-server.example.com:12345</a>=
</span><br></div><br class=3D"gmail-Apple-interchange-newline"></div><div c=
lass=3D"gmail_default" style=3D"color:rgb(0,0,0)"><span style=3D"color:rgb(=
34,34,34)">mapped to the empty export name.</span></div></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span class=
=3D"gmail_default"></span></div></div><div><span style=3D"color:rgb(0,0,0)"=
><span class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><=
/span>N</span><span style=3D"color:rgb(0,0,0)">ir</span></div></div></div>

--000000000000ddf2f90589750b39--

