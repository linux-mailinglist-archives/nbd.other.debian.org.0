Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F832A994
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 14:19:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1F7E420493; Sun, 26 May 2019 12:19:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 12:19:56 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4C11420480
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 12:19:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, HTML_MESSAGE=2,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, WEIRD_PORT=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Y5V11kTdTLbq for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 12:19:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2E5ED2043B
	for <nbd@other.debian.org>; Sun, 26 May 2019 12:19:42 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id u199so10096807oie.5
        for <nbd@other.debian.org>; Sun, 26 May 2019 05:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7n6JvWwjw5bo5st6yA3nLX48zK3OFc2e+4up6YvlrU=;
        b=giuDNJEPxOE7cTOnVMRc8UCrFCtiRoA47vPdd2ui4GFggAEVEcESW0oxY5rlnlX5Q9
         XwrRnLSFemm9+HEL6ld/lpYOghtgFdD6OWXnThXLLgzW/ZbcrO6G35rNXU4ulGT5EH9K
         gMLy++izb8L8vOJOo9hXopm6akb8N87dhussYFnIbVnLr09gEvUnDY1A/JM+iMTQzPu/
         IgKDH/5x8kuziz8xIvlauoTdnYOf6ZqnLwRM7OfGxN0O9qBK2wmHiKftYylmpPSWQGKc
         lmba398FqJ+gR1mtVB6Alz6JiksmYvymABk3dkiwuwIBPTVxWM+hmRyaZfF/t9k6P+Ue
         3R0g==
X-Gm-Message-State: APjAAAW9F2JRpzjonF1Jxp2rKQrr6fGHf6V644Bol3DxLYzhdQPtaJ2U
	31yfHrPown8QuJY6dTnnCNRUb1dWFf+KxZsymdh6fA==
X-Google-Smtp-Source: APXvYqxaS1KT5Bj7aUb/g0hlBSdgjW7XA7WH+kcOmQsxPh5MZO9Jts7PfihAGlMzN/mWHSuq9j+LkM94mqvwUUyPch0=
X-Received: by 2002:aca:de44:: with SMTP id v65mr11067441oig.135.1558873179655;
 Sun, 26 May 2019 05:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190525170518.4799-1-rjones@redhat.com>
In-Reply-To: <20190525170518.4799-1-rjones@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 26 May 2019 15:19:30 +0300
Message-ID: <CAMRbyyuyMx143KxTyHiE-2uFOdY47nkye_KtcF_2Uqj-6M9VXA@mail.gmail.com>
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD URIs.
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, Wouter Verhelst <w@uter.be>, Eric Blake <eblake@redhat.com>, 
	"Daniel P. Berrange" <berrange@redhat.com>, Martin Kletzander <mkletzan@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001fb0720589c972f0"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2LfWHQ2-cBO.A.XGG.sRo6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/531
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyuyMx143KxTyHiE-2uFOdY47nkye_KtcF_2Uqj-6M9VXA@mail.gmail.com
Resent-Date: Sun, 26 May 2019 12:19:56 +0000 (UTC)

--0000000000001fb0720589c972f0
Content-Type: text/plain; charset="UTF-8"

On Sat, May 25, 2019 at 8:05 PM Richard W.M. Jones <rjones@redhat.com>
wrote:

> For further information about discussion around this standard, see
> this thread on the mailing list:
> https://lists.debian.org/nbd/2019/05/msg00013.html
>
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  doc/Makefile.am |   2 +-
>  doc/uri.md      | 124 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+), 1 deletion(-)
>
> diff --git a/doc/Makefile.am b/doc/Makefile.am
> index 7f0284c..fa8a4b0 100644
> --- a/doc/Makefile.am
> +++ b/doc/Makefile.am
> @@ -1 +1 @@
> -EXTRA_DIST = README proto.md todo.txt
> +EXTRA_DIST = README proto.md todo.txt uri.md
> diff --git a/doc/uri.md b/doc/uri.md
> new file mode 100644
> index 0000000..143954c
> --- /dev/null
> +++ b/doc/uri.md
> @@ -0,0 +1,124 @@
> +# The NBD Uniform Resource Indicator (URI) format
> +
> +## Introduction
> +
> +This document describes the standard URI format that clients may use
> +to refer to an export located on an NBD server.
> +
> +## Convention
> +
> +"NBD" stands for Network Block Device and refers to the protocol
> +described in the adjacent protocol document also available online at
> +<
> https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#the-nbd-protocol
> >
> +
> +"URI" stands for Uniform Resource Indicator and refers to the standard
> +introduced in [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) and
> +subsequent IETF standards.
> +
> +The key words "MUST", "MUST NOT", "REQUIRED", "SHALL",
> +"SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",
> +"MAY", and "OPTIONAL" in this document are to be interpreted as
> +described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).
> +The same words in lower case carry their natural meaning.
> +
> +## Related standards
> +
> +All NBD URIs MUST also be valid URIs as described in
> +[RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) and any subsequent
> +IETF standards describing URIs.  This means that any parsing, quoting
> +or encoding issues that may arise when making or parsing an NBD URI
> +must be answered by consulting IETF standards.
> +
> +## NBD URI components
> +
> +An NBD URI consists of the following components:
> +
> +     +------- Scheme (required)
> +     |
> +     |            +------- Authority (optional)
> +     |            |
> +     |            |           +------- Export name (optional)
> +     |            |           |
> +     v            v           v
> +    nbd://example.com:10809/export
> +
> +    nbd+unix:///export?socket=nbd.sock
> +                           ^
> +                           |
> +                           +---- Query parameters

+
> +## NBD URI scheme
> +
> +One of the following scheme names SHOULD be used to indicate an NBD URI:
> +
> +* `nbd`: NBD over an unencrypted or opportunistically encrypted TCP/IP
> +  connection.
> +
> +* `nbds`: NBD over an encrypted TCP/IP connection.  If encryption
> +  cannot be negotiated then the connection MUST fail.
> +
> +* `nbd+unix`: NBD over a Unix domain socket.  The query parameters
> +  MUST include a parameter called `socket` which refers to the name of
> +  the Unix domain socket.
> +
> +Other URI scheme names MAY be used but not all NBD clients will
> +understand them or even recognize that they refer to NBD.
> +
> +## NBD URI authority
> +
> +The authority field SHOULD be used for TCP/IP connections and SHOULD
> +NOT be used for Unix domain socket connections.
> +
> +The authority field MAY contain the `userinfo`, `host` and/or `port`
> +fields as defined in [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt)
> +section 3.2.
> +
> +The `host` field may be a host name or IP address.  Literal IPv6
> +addresses MUST be formatted in the way specified by
> +[RFC 2732](https://www.ietf.org/rfc/rfc2732.txt).
> +
> +If the `port` field is not present then it MUST default to the NBD
> +port number assigned by IANA (10809).
> +
> +The `userinfo` field is used to supply a username for TLS
> +authentication.  If the `userinfo` field is not present then it SHOULD
> +default to a local operating system credential if one is available.
> +
> +It is up to the NBD client what should happen if the authority field
> +is not present for TCP/IP connections, or present for Unix domain
> +socket connections.  Options might include failing with an error,
> +ignoring it, or using defaults.
> +
> +## NBD URI export name
> +
> +The path part of the URI except for the leading `/` character MAY be
> +passed to the server as the export name.
> +
> +For example:
>

Testing how existing url parser treat the urls:

> +
> +    NBD URI                          export name
> +    ----------------------------------------------------
> +    nbd://example.com/disk           disk
>

>>> urlparse("nbd://example.com/disk")
ParseResult(scheme='nbd', netloc='example.com', path='/disk', params='',
query='', fragment='')

> +    nbd+unix:///disk                 disk
>

>>> urlparse("nbd+unix:///disk")
ParseResult(scheme='nbd+unix', netloc='', path='/disk', params='',
query='', fragment='')


> +    nbd://example.com/               (empty string)
>

>>> urlparse("nbd://example.com/")
ParseResult(scheme='nbd', netloc='example.com', path='/', params='',
query='', fragment='')

> +    nbd://example.com                (empty string)
> +    nbd://example.com//disk          /disk
> +    nbd://example.com/hello%20world  hello world
>

So it seems that we need to teach url parsers about removing / from nbd
urls,
otherwise all users will have do this after parsing the url.

Testing how this works with qemu-nbd/qemu-img 4.0.0:

nbd+unix:

$ qemu-nbd -t -r -k /tmp/nbd.sock -x disk test.qcow2
$ qemu-img info nbd+unix:///disk?socket=/tmp/nbd.sock
(works)

nbd:

$ qemu-nbd -t -r -x disk test.qcow2
$ qemu-img info nbd://localhost/disk
(works)

But this also works:

$ qemu-img info nbd://localhost///disk
image: nbd://localhost:10809/disk

So qemu-nbd seems to normalize leading "///" to "", and there
is no way to use export name with leading /.

$ qemu-nbd -t -r -x /disk test.qcow2
$ qemu-img info nbd://localhost//disk
qemu-img: Could not open 'nbd://localhost//disk': Requested export not
available
server reported: export 'disk' not present

I think we can treat this a qemu bug.

+
> +Note that export names are not usually paths, they are free text
> +strings.  In particular they do not usually start with a `/`
> +character, they may be an empty string, and they may contain any
> +Unicode character.
> +
> +NBD servers MAY restrict the export names they are able to parse (for
> +example by only accepting 7 bit ASCII names).  The reader should refer
> +to the NBD protocol.

+
> +## NBD URI query parameters
> +
> +The query part of the URI is used when connecting to Unix domain
> +sockets (when the scheme name is `nbd+unix`).  In this case it MUST
> +include a `socket` key, referring to the Unix domain socket which on
> +Unix-like systems is usually a special file on the local disk.
> +
> +Query parameters other than `socket` SHOULD be ignored by the parser.
> --
> 2.21.0
>
>

--0000000000001fb0720589c972f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:#000000"><span style=3D"color:rgb(34,34,34)">On Sat, May=
 25, 2019 at 8:05 PM Richard W.M. Jones &lt;<a href=3D"mailto:rjones@redhat=
.com" target=3D"_blank">rjones@redhat.com</a>&gt; wrote:</span><br></div></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">For further information about discussion around this standard, see<br=
>
this thread on the mailing list:<br>
<a href=3D"https://lists.debian.org/nbd/2019/05/msg00013.html" rel=3D"noref=
errer" target=3D"_blank">https://lists.debian.org/nbd/2019/05/msg00013.html=
</a><br>
<br>
Signed-off-by: Richard W.M. Jones &lt;<a href=3D"mailto:rjones@redhat.com" =
target=3D"_blank">rjones@redhat.com</a>&gt;<br>
---<br>
=C2=A0doc/Makefile.am |=C2=A0 =C2=A02 +-<br>
=C2=A0doc/uri.md=C2=A0 =C2=A0 =C2=A0 | 124 ++++++++++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A02 files changed, 125 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/doc/Makefile.am b/doc/Makefile.am<br>
index 7f0284c..fa8a4b0 100644<br>
--- a/doc/Makefile.am<br>
+++ b/doc/Makefile.am<br>
@@ -1 +1 @@<br>
-EXTRA_DIST =3D README proto.md todo.txt<br>
+EXTRA_DIST =3D README proto.md todo.txt uri.md<br>
diff --git a/doc/uri.md b/doc/uri.md<br>
new file mode 100644<br>
index 0000000..143954c<br>
--- /dev/null<br>
+++ b/doc/uri.md<br>
@@ -0,0 +1,124 @@<br>
+# The NBD Uniform Resource Indicator (URI) format<br>
+<br>
+## Introduction<br>
+<br>
+This document describes the standard URI format that clients may use<br>
+to refer to an export located on an NBD server.<br>
+<br>
+## Convention<br>
+<br>
+&quot;NBD&quot; stands for Network Block Device and refers to the protocol=
<br>
+described in the adjacent protocol document also available online at<br>
+&lt;<a href=3D"https://github.com/NetworkBlockDevice/nbd/blob/master/doc/p=
roto.md#the-nbd-protocol" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#the-nbd-protocol</a>=
&gt;<br>
+<br>
+&quot;URI&quot; stands for Uniform Resource Indicator and refers to the st=
andard<br>
+introduced in [RFC 3986](<a href=3D"https://www.ietf.org/rfc/rfc3986.txt" =
rel=3D"noreferrer" target=3D"_blank">https://www.ietf.org/rfc/rfc3986.txt</=
a>) and<br>
+subsequent IETF standards.<br>
+<br>
+The key words &quot;MUST&quot;, &quot;MUST NOT&quot;, &quot;REQUIRED&quot;=
, &quot;SHALL&quot;,<br>
+&quot;SHALL NOT&quot;, &quot;SHOULD&quot;, &quot;SHOULD NOT&quot;, &quot;R=
ECOMMENDED&quot;,<br>
+&quot;MAY&quot;, and &quot;OPTIONAL&quot; in this document are to be inter=
preted as<br>
+described in [RFC 2119](<a href=3D"https://www.ietf.org/rfc/rfc2119.txt" r=
el=3D"noreferrer" target=3D"_blank">https://www.ietf.org/rfc/rfc2119.txt</a=
>).<br>
+The same words in lower case carry their natural meaning.<br>
+<br>
+## Related standards<br>
+<br>
+All NBD URIs MUST also be valid URIs as described in<br>
+[RFC 3986](<a href=3D"https://www.ietf.org/rfc/rfc3986.txt" rel=3D"norefer=
rer" target=3D"_blank">https://www.ietf.org/rfc/rfc3986.txt</a>) and any su=
bsequent<br>
+IETF standards describing URIs.=C2=A0 This means that any parsing, quoting=
<br>
+or encoding issues that may arise when making or parsing an NBD URI<br>
+must be answered by consulting IETF standards.<br>
+<br>
+## NBD URI components<br>
+<br>
+An NBD URI consists of the following components:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0+------- Scheme (required)<br>
+=C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------- Au=
thority (optional)<br>
+=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------- Export name (optional)<br>
+=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0v=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v<br>
+=C2=A0 =C2=A0 nbd://<a href=3D"http://example.com:10809/export" rel=3D"nor=
eferrer" target=3D"_blank">example.com:10809/export</a><br>
+=C2=A0 =C2=A0 <br><font face=3D"arial, sans-serif">
+=C2=A0 =C2=A0 nbd+unix:///export?socket=3Dnbd.sock<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0+---- Query parameters</font></blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+<br>
+## NBD URI scheme<br>
+<br>
+One of the following scheme names SHOULD be used to indicate an NBD URI:<b=
r>
+<br>
+* `nbd`: NBD over an unencrypted or opportunistically encrypted TCP/IP<br>
+=C2=A0 connection.<br>
+<br>
+* `nbds`: NBD over an encrypted TCP/IP connection.=C2=A0 If encryption<br>
+=C2=A0 cannot be negotiated then the connection MUST fail.<br>
+<br>
+* `nbd+unix`: NBD over a Unix domain socket.=C2=A0 The query parameters<br=
>
+=C2=A0 MUST include a parameter called `socket` which refers to the name o=
f<br>
+=C2=A0 the Unix domain socket.<br>
+<br>
+Other URI scheme names MAY be used but not all NBD clients will<br>
+understand them or even recognize that they refer to NBD.<br>
+<br>
+## NBD URI authority<br>
+<br>
+The authority field SHOULD be used for TCP/IP connections and SHOULD<br>
+NOT be used for Unix domain socket connections.<br>
+<br>
+The authority field MAY contain the `userinfo`, `host` and/or `port`<br>
+fields as defined in [RFC 3986](<a href=3D"https://www.ietf.org/rfc/rfc398=
6.txt" rel=3D"noreferrer" target=3D"_blank">https://www.ietf.org/rfc/rfc398=
6.txt</a>)<br>
+section 3.2.<br>
+<br>
+The `host` field may be a host name or IP address.=C2=A0 Literal IPv6<br>
+addresses MUST be formatted in the way specified by<br>
+[RFC 2732](<a href=3D"https://www.ietf.org/rfc/rfc2732.txt" rel=3D"norefer=
rer" target=3D"_blank">https://www.ietf.org/rfc/rfc2732.txt</a>).<br>
+<br>
+If the `port` field is not present then it MUST default to the NBD<br>
+port number assigned by IANA (10809).<br>
+<br>
+The `userinfo` field is used to supply a username for TLS<br>
+authentication.=C2=A0 If the `userinfo` field is not present then it SHOUL=
D<br>
+default to a local operating system credential if one is available.<br>
+<br>
+It is up to the NBD client what should happen if the authority field<br>
+is not present for TCP/IP connections, or present for Unix domain<br>
+socket connections.=C2=A0 Options might include failing with an error,<br>
+ignoring it, or using defaults.<br>
+<br>
+## NBD URI export name<br>
+<br>
+The path part of the URI except for the leading `/` character MAY be<br>
+passed to the server as the export name.<br>
+<br>
+For example:<br></blockquote><div><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small;color:rgb(0,0,0)">Testing how existing url parser t=
reat the urls:</div><div class=3D"gmail_default" style=3D"font-size:small;c=
olor:rgb(0,0,0)"></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 NBD URI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export name<br>
+=C2=A0 =C2=A0 ----------------------------------------------------<br>
+=C2=A0 =C2=A0 nbd://<a href=3D"http://example.com/disk" rel=3D"noreferrer"=
 target=3D"_blank">example.com/disk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0disk<br></blockquote><div><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small;color:rgb(0,0,0)"><span style=3D"color:rgb(34,34,34)">=
&gt;&gt;&gt; urlparse(&quot;nbd://<a href=3D"http://example.com/disk" targe=
t=3D"_blank">example.com/disk</a>&quot;)</span></div>ParseResult(scheme=3D&=
#39;nbd&#39;, netloc=3D&#39;<a href=3D"http://example.com" target=3D"_blank=
">example.com</a>&#39;, path=3D&#39;/disk&#39;, params=3D&#39;&#39;, query=
=3D&#39;&#39;, fragment=3D&#39;&#39;)<br><div class=3D"gmail_default" style=
=3D"font-size:small;color:rgb(0,0,0)"></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+=C2=A0 =C2=A0 nbd+unix:///disk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0disk<br></blockquote><div><br></div><div>&gt;&gt;&gt; u=
rlparse(&quot;nbd+unix:///disk&quot;)<br>ParseResult(scheme=3D&#39;nbd+unix=
&#39;, netloc=3D&#39;&#39;, path=3D&#39;/disk&#39;, params=3D&#39;&#39;, qu=
ery=3D&#39;&#39;, fragment=3D&#39;&#39;)<br><div class=3D"gmail_default" st=
yle=3D"font-size:small;color:rgb(0,0,0)"><span style=3D"color:rgb(34,34,34)=
">=C2=A0</span></div></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+=C2=A0 =C2=A0 <span class=3D"gmail_default" style=3D"font-size:small;color=
:rgb(0,0,0)"></span>nbd://<a href=3D"http://example.com/" rel=3D"noreferrer=
" target=3D"_blank">example.com/</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(empty string)<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span style=
=3D"color:rgb(34,34,34)">&gt;&gt;&gt; urlparse(&quot;nbd://<a href=3D"http:=
//example.com/" target=3D"_blank">example.com/</a>&quot;)</span></div>Parse=
Result(scheme=3D&#39;nbd&#39;, netloc=3D&#39;<a href=3D"http://example.com"=
 target=3D"_blank">example.com</a>&#39;, path=3D&#39;/&#39;, params=3D&#39;=
&#39;, query=3D&#39;&#39;, fragment=3D&#39;&#39;)<br><div class=3D"gmail_de=
fault" style=3D"font-size:small;color:rgb(0,0,0)"></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 nbd://<a href=3D"http://example.com" rel=3D"noreferrer" targ=
et=3D"_blank">example.com</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (empty string)<br>
+=C2=A0 =C2=A0 nbd://<a href=3D"http://example.com//disk" rel=3D"noreferrer=
" target=3D"_blank">example.com//disk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /disk<br>
+=C2=A0 =C2=A0 nbd://<a href=3D"http://example.com/hello%20world" rel=3D"no=
referrer" target=3D"_blank">example.com/hello%20world</a>=C2=A0 hello world=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small;color:rgb(0,0,0)">So it seems that we need to teach url par=
sers about removing / from nbd urls,</div><div class=3D"gmail_default" styl=
e=3D"font-size:small;color:rgb(0,0,0)">otherwise all users will have do thi=
s after parsing the url.</div></div><div class=3D"gmail_default" style=3D"f=
ont-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small;color:rgb(0,0,0)">Testing how this works with qemu-nb=
d/qemu-img 4.0.0:</div><div class=3D"gmail_default" style=3D"font-size:smal=
l;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small;color:rgb(0,0,0)">nbd+unix:</div><div class=3D"gmail_default" styl=
e=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small;color:rgb(0,0,0)">$ qemu-nbd -t -r -k /tmp/nbd.=
sock -x disk test.qcow2</div><div class=3D"gmail_default" style=3D"font-siz=
e:small;color:rgb(0,0,0)">$ qemu-img info nbd+unix:///disk?socket=3D/tmp/nb=
d.sock<br></div><div class=3D"gmail_default" style=3D"font-size:small;color=
:rgb(0,0,0)">(works)</div><div class=3D"gmail_default" style=3D"font-size:s=
mall;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small;color:rgb(0,0,0)">nbd:</div><div class=3D"gmail_default" style=
=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small;color:rgb(0,0,0)">$ qemu-nbd -t -r -x disk test.=
qcow2<br></div><div class=3D"gmail_default" style=3D"font-size:small;color:=
rgb(0,0,0)">$ qemu-img info nbd://localhost/disk<br></div><div class=3D"gma=
il_default" style=3D"font-size:small;color:rgb(0,0,0)">(works)</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">But=
 this also works:</div><div class=3D"gmail_default" style=3D"font-size:smal=
l;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small;color:rgb(0,0,0)">$ qemu-img info nbd://localhost///disk<br>image:=
 nbd://localhost:10809/disk<br><br></div><div class=3D"gmail_default" style=
=3D"font-size:small;color:rgb(0,0,0)">So qemu-nbd seems to normalize leadin=
g &quot;///&quot; to &quot;&quot;, and there</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small;color:rgb(0,0,0)">is no way to use export name=
 with leading /.</div><div class=3D"gmail_default" style=3D"font-size:small=
;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small;color:rgb(0,0,0)">$ qemu-nbd -t -r -x /disk test.qcow2<br></div><di=
v class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">$ qemu=
-img info nbd://localhost//disk<br>qemu-img: Could not open &#39;nbd://loca=
lhost//disk&#39;: Requested export not available<br>server reported: export=
 &#39;disk&#39; not present</div><div class=3D"gmail_default" style=3D"font=
-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small;color:rgb(0,0,0)">I think we can treat this a qemu bug.=
</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0=
)"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+Note that export names are not usually paths, they are free text<br>
+strings.=C2=A0 In particular they do not usually start with a `/`<br>
+character, they may be an empty string, and they may contain any<br>
+Unicode character.<br>
+<br>
+NBD servers MAY restrict the export names they are able to parse (for<br>
+example by only accepting 7 bit ASCII names).=C2=A0 The reader should refe=
r<br>
+to the NBD protocol.=C2=A0</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+<br>
+## NBD URI query parameters<br>
+<br>
+The query part of the URI is used when connecting to Unix domain<br>
+sockets (when the scheme name is `nbd+unix`).=C2=A0 In this case it MUST<b=
r>
+include a `socket` key, referring to the Unix domain socket which on<br>
+Unix-like systems is usually a special file on the local disk.<br>
+<br>
+Query parameters other than `socket` SHOULD be ignored by the parser.<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div></div>

--0000000000001fb0720589c972f0--

