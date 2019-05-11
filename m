Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A631A84D
	for <lists+nbd@lfdr.de>; Sat, 11 May 2019 17:48:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2CC4D2071E; Sat, 11 May 2019 15:48:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 11 15:48:45 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4E1FF20713
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 May 2019 15:48:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.898 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, HTML_MESSAGE=2,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6P1qoUIzSKJy for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 May 2019 15:48:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .mail-ot1-f52.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3DCD5206EB
	for <nbd@other.debian.org>; Sat, 11 May 2019 15:48:31 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id l17so8230004otq.1
        for <nbd@other.debian.org>; Sat, 11 May 2019 08:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kolS83Rh/Qz+x40/aXrOXDZmAIslCgKSmkC0RMLls/s=;
        b=FGQAzCC2oslihVBWRlfxVQbMgIJ+BptSlldqJEY0jPvvP6lj2R3tThEBRvCr6jiXGw
         JALUVe4EVJg/ldNAcvf/UYYy53pFi+pfIgGX9dCBpTmrT7nn/w2xppCt86Ia2PLLDoZQ
         hBdQNZSbhdk8CYG5TSNlLTxLH/yMLLLNtmc2PTSIjZ1RHQY93rCHMyFEGPwzPQ4GAPSL
         KYiat94kcGnGj77ynUXdkF/Dft14bqTZWPldtRLrRkXz6CsmhY8mE217gbITwDHV26qN
         LHiQXWjDB6dtNR9eexLmO4+b0RoREKmlCpZu0b1odRb3eNH1E5traO48qh3caeUkS3sA
         u14Q==
X-Gm-Message-State: APjAAAVll8UWuveIjTpbnWrty3HLJaIkIIIDLHUlENRB9j8hw+9lmmuP
	D10jDdel/1MJ3mn9z0ldYDrLusCoIGgeOVv9Bi4u2g==
X-Google-Smtp-Source: APXvYqygluK7CWqJrxJZDgEATXd3ZkpKBuqJVz1WZmXFsFUr6ZNJxYLIJc84vEhClN6OdYvny99vjCkxr24KXMvCJrs=
X-Received: by 2002:a9d:361:: with SMTP id 88mr10468330otv.361.1557589708482;
 Sat, 11 May 2019 08:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190430124626.GA11138@redhat.com> <CAMRbyytny=8nC1LevEBwYN9cbuzJwG_HjdN5QQsXR-+ROy-MpA@mail.gmail.com>
 <20190511110356.GN9582@redhat.com> <CAMRbyyt+1y+E5=oT6ZS1iRwXG+wUvHh0ZKR+3ANAX1GsYHdPpg@mail.gmail.com>
 <20190511123957.GO9582@redhat.com>
In-Reply-To: <20190511123957.GO9582@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sat, 11 May 2019 18:48:15 +0300
Message-ID: <CAMRbyyurc0wF0=HOicVVEhLte7Oy=oHDGnxHOQH5afN=CVO6+A@mail.gmail.com>
Subject: Re: Requirements for an NBD client library in userspace
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>, 
	Martin Kletzander <mkletzan@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000047cfd805889e9d9b"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YDP7P0rnI2G.A.HbH.d7u1cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/495
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyurc0wF0=HOicVVEhLte7Oy=oHDGnxHOQH5afN=CVO6+A@mail.gmail.com
Resent-Date: Sat, 11 May 2019 15:48:45 +0000 (UTC)

--00000000000047cfd805889e9d9b
Content-Type: text/plain; charset="UTF-8"

On Sat, May 11, 2019, 15:39 Richard W.M. Jones <rjones@redhat.com> wrote:

> On Sat, May 11, 2019 at 03:28:28PM +0300, Nir Soffer wrote:
> > On Sat, May 11, 2019, 14:03 Richard W.M. Jones <rjones@redhat.com>
> wrote:
> >
> > > On Tue, Apr 30, 2019 at 04:43:03PM +0300, Nir Soffer wrote:
> > > > On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones <rjones@redhat.com>
> > > wrote:
> > > >
> > > > > I believe there is no simple NBD client library.  Am I wrong about
> > > > > this?  Let's assume I'm not for the sake of the rest of this email
> ...
> > > > >
> > > > > We do however have at least 4 places this could be consumed if it
> > > existed:
> > > > >
> > > > >  - fio's proposed NBD engine
> > > > >    https://www.spinics.net/lists/fio/msg07831.html
> > > > >
> > > > >  - nbdkit-nbd-plugin
> > > > >    https://github.com/libguestfs/nbdkit/tree/master/plugins/nbd
> > > > >
> > > > >  - Martin K's forthcoming VMware liberation tool
> > > > >
> > > > >  - qemu, maybe?
> > > > >    https://github.com/qemu/qemu/blob/master/block/nbd-client.c
> > > >
> > > >
> > > > oVirt imageio, replacing pure python client, used to implement
> nbd-http
> > > > proxy
> > > >
> > >
> https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_imageio_common/nbd.py
> > >
> > > It looks like imageio is Python 2.  I'm trying to write libnbd
> > > bindings for Python now, but TBH supporting Python 2 is turning out to
> > > be painful, because there are plenty of Python 3 features it would be
> > > nice to use ("b" boolean conversions, proper bytes handling and
> > > PyUnicode_FSConverter are three particular features).  Do you really
> > > need Python 2?  What is the roadmap for using Python 3 with imageio?
> > >
> >
> > We plan to drop python 2 for 4.4. I don't that anyone care about python 2
> > now.
>
> I wrote some initial, very preliminary bindings, see top commit(s) here:
>
>   https://github.com/rwmjones/libnbd
>
> Simple synchronous calls appear to work.  However they don't work for
> asynchronous calls because the idiom of:
>
>   char buf[512];


>   conn = nbd_get_connection (nbd, 0);
>   hid = nbd_aio_pread (conn, buf, sizeof buf, 0);
>   /* ... various calls to poll/wait here ... */
>   if (nbd_aio_command_completed (conn, hid)) {
>     /* now we can use the data in buf ... */
>   }
>
> doesn't translate well into Python and passing buffers in and out of C
> code.  That's TBD.
>

buf can come from the python layer, using the buffer protocol.

    Py_buffer b;

    if (!PyArg_ParseTuple(args, "s*", &b))
        return NULL;

    nbd_pread(h, &b.buf, b.len, offset);

    PyBuffer_Release(&b);

The argument on the python side can be bytearray(), mmap(), or memoryview().

If you want to provide the simplest interface returning bytes:

   pread(offset, length) -> bytes

You can add a version receiving a buffer:

    pread_into(offset, buf) -> n

Like socket.recv(), socket.recv_into().

In imageio nbd client we implement read() and readinto().

Adding readinfo() to imageio show 12% improvement, see:
https://github.com/oVirt/ovirt-imageio/commit/dbc3463349128357030903addb3f5d1ad464f30b

Buffer size is also important, another reason to let the client provide the
buffer. See:
https://github.com/oVirt/ovirt-imageio/commit/d9ad5ea75013598074e07587c6902767fcbcb4a2


> The imageio code goes appear to be doing anything asynch if I'm
> understanding the code correctly.
>

imageio is using only synchronous code. I'm not sure how are we going to map
http to nbd using async api.

It will be interesting to compare libnbd with imageio pure python nbd
client.
We can use imageio example nbd-client:
https://github.com/oVirt/ovirt-imageio/blob/91609bf5b56e1e9a85bf1edae4b916659514c7fd/examples/nbd-client#L72


> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat
> http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v
>

--00000000000047cfd805889e9d9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, May 11, 2019, 15:39 Richard W.M. Jon=
es &lt;<a href=3D"mailto:rjones@redhat.com" target=3D"_blank">rjones@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Sat, May 11, 2019 at 03:28:28PM +0300, Nir Soffer wrote:<br>
&gt; On Sat, May 11, 2019, 14:03 Richard W.M. Jones &lt;<a href=3D"mailto:r=
jones@redhat.com" rel=3D"noreferrer" target=3D"_blank">rjones@redhat.com</a=
>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Tue, Apr 30, 2019 at 04:43:03PM +0300, Nir Soffer wrote:<br>
&gt; &gt; &gt; On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones &lt;<a href=
=3D"mailto:rjones@redhat.com" rel=3D"noreferrer" target=3D"_blank">rjones@r=
edhat.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I believe there is no simple NBD client library.=C2=A0 =
Am I wrong about<br>
&gt; &gt; &gt; &gt; this?=C2=A0 Let&#39;s assume I&#39;m not for the sake o=
f the rest of this email ...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We do however have at least 4 places this could be cons=
umed if it<br>
&gt; &gt; existed:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 - fio&#39;s proposed NBD engine<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://www.spinics.net/lists/f=
io/msg07831.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://w=
ww.spinics.net/lists/fio/msg07831.html</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 - nbdkit-nbd-plugin<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/libguestfs/n=
bdkit/tree/master/plugins/nbd" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://github.com/libguestfs/nbdkit/tree/master/plugins/nbd</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 - Martin K&#39;s forthcoming VMware liberation to=
ol<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 - qemu, maybe?<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/qemu/qemu/bl=
ob/master/block/nbd-client.c" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://github.com/qemu/qemu/blob/master/block/nbd-client.c</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; oVirt imageio, replacing pure python client, used to impleme=
nt nbd-http<br>
&gt; &gt; &gt; proxy<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/oVirt/ovirt-imageio/blob/master/com=
mon/ovirt_imageio_common/nbd.py" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_image=
io_common/nbd.py</a><br>
&gt; &gt;<br>
&gt; &gt; It looks like imageio is Python 2.=C2=A0 I&#39;m trying to write =
libnbd<br>
&gt; &gt; bindings for Python now, but TBH supporting Python 2 is turning o=
ut to<br>
&gt; &gt; be painful, because there are plenty of Python 3 features it woul=
d be<br>
&gt; &gt; nice to use (&quot;b&quot; boolean conversions, proper bytes hand=
ling and<br>
&gt; &gt; PyUnicode_FSConverter are three particular features).=C2=A0 Do yo=
u really<br>
&gt; &gt; need Python 2?=C2=A0 What is the roadmap for using Python 3 with =
imageio?<br>
&gt; &gt;<br>
&gt; <br>
&gt; We plan to drop python 2 for 4.4. I don&#39;t that anyone care about p=
ython 2<br>
&gt; now.<br>
<br>
I wrote some initial, very preliminary bindings, see top commit(s) here:<br=
>
<br>
=C2=A0 <a href=3D"https://github.com/rwmjones/libnbd" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://github.com/rwmjones/libnbd</a><br>
<br>
Simple synchronous calls appear to work.=C2=A0 However they don&#39;t work =
for<br>
asynchronous calls because the idiom of:<br>
<br>
=C2=A0 char buf[512];</blockquote></div></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 conn =3D nbd_get_connection (nbd, 0);<br>
=C2=A0 hid =3D nbd_aio_pread (conn, buf, sizeof buf, 0);<br>
=C2=A0 /* ... various calls to poll/wait here ... */<br>
=C2=A0 if (nbd_aio_command_completed (conn, hid)) {<br>
=C2=A0 =C2=A0 /* now we can use the data in buf ... */<br>
=C2=A0 }<br>
<br>
doesn&#39;t translate well into Python and passing buffers in and out of C<=
br>
code.=C2=A0 That&#39;s TBD.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span class=
=3D"gmail_default">b</span><span style=3D"color:rgb(34,34,34)">uf can come =
from the python layer, using the buffer protocol.</span></div><div class=3D=
"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span style=3D"c=
olor:rgb(34,34,34)"><br></span></div><div class=3D"gmail_default"><div clas=
s=3D"gmail_default">=C2=A0 =C2=A0 Py_buffer b;</div><div class=3D"gmail_def=
ault"><br></div><div class=3D"gmail_default">=C2=A0 =C2=A0 if (!PyArg_Parse=
Tuple(args, &quot;s*&quot;, &amp;b))<br></div><div class=3D"gmail_default">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;</div><div class=3D"gmail_default">=
<br></div><div class=3D"gmail_default">=C2=A0 =C2=A0 nbd_pread(h, &amp;b.bu=
f, b.len, offset);</div><div class=3D"gmail_default"><br></div><div class=
=3D"gmail_default">=C2=A0 =C2=A0 PyBuffer_Release(&amp;b);</div></div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">The argument on the python side can=
 be bytearray(), mmap(), or memoryview().</div><div class=3D"gmail_default"=
><br></div><div class=3D"gmail_default"><div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(0,0,0)">If you want to provide the simplest interface ret=
urning bytes:</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=
<br></div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">=C2=A0 =
=C2=A0pread(offset, length) -&gt; bytes</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"c=
olor:rgb(0,0,0)">You can add a version receiving a buffer:</div><div class=
=3D"gmail_default" style=3D"color:rgb(0,0,0)"><br></div><div class=3D"gmail=
_default" style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 pread_into(offset, buf) =
-&gt; n</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"><br></=
div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)">Like socket.rec=
v(), socket.recv_into().<br></div></div><br class=3D"gmail-Apple-interchang=
e-newline"></div><div class=3D"gmail_default"><div class=3D"gmail_default">=
In imageio nbd client we implement read() and readinto().</div></div><div c=
lass=3D"gmail_default" style=3D""><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small;color:rgb(0,0,0)">Adding readinfo() to imageio show =
12% improvement, see:</div><div class=3D"gmail_default" style=3D"font-size:=
small;color:rgb(0,0,0)"><a href=3D"https://github.com/oVirt/ovirt-imageio/c=
ommit/dbc3463349128357030903addb3f5d1ad464f30b">https://github.com/oVirt/ov=
irt-imageio/commit/dbc3463349128357030903addb3f5d1ad464f30b</a></div><div c=
lass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">Bu=
ffer size is also important, another reason to let the client provide the b=
uffer. See:</div><div class=3D"gmail_default" style=3D"font-size:small;colo=
r:rgb(0,0,0)"><a href=3D"https://github.com/oVirt/ovirt-imageio/commit/d9ad=
5ea75013598074e07587c6902767fcbcb4a2">https://github.com/oVirt/ovirt-imagei=
o/commit/d9ad5ea75013598074e07587c6902767fcbcb4a2</a></div><div class=3D"gm=
ail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span style=3D"colo=
r:rgb(34,34,34)">=C2=A0</span></div></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">The imageio code goes appear to be doing anything asynch i=
f I&#39;m<br>
understanding the code correctly.<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">imageio is using<span class=3D"gmail_defau=
lt" style=3D"font-size:small;color:rgb(0,0,0)"> only</span> synchronous cod=
e.<span class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">=
 I&#39;m not sure how are we going to map</span></div><div><span class=3D"g=
mail_default" style=3D"font-size:small;color:rgb(0,0,0)">http to nbd using =
async api.</span></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span sty=
le=3D"color:rgb(34,34,34)">It will be interesting to compare libnbd with im=
ageio pure python nbd client.</span></div><div class=3D"gmail_default" styl=
e=3D"font-size:small;color:rgb(0,0,0)"><span style=3D"color:rgb(34,34,34)">=
We can use imageio example nbd-client:</span><br></div><div class=3D"gmail_=
default" style=3D"color:rgb(0,0,0)"><div class=3D"gmail_default"><div class=
=3D"gmail_default" style=3D"color:rgb(34,34,34)"><font color=3D"#000000"><a=
 href=3D"https://github.com/oVirt/ovirt-imageio/blob/91609bf5b56e1e9a85bf1e=
dae4b916659514c7fd/examples/nbd-client#L72">https://github.com/oVirt/ovirt-=
imageio/blob/91609bf5b56e1e9a85bf1edae4b916659514c7fd/examples/nbd-client#L=
72</a></font><span style=3D"color:rgb(0,0,0)"></span></div></div></div><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Rich.<br>
<br>
-- <br>
Richard Jones, Virtualization Group, Red Hat <a href=3D"http://people.redha=
t.com/~rjones" rel=3D"noreferrer noreferrer" target=3D"_blank">http://peopl=
e.redhat.com/~rjones</a><br>
Read my programming and virtualization blog: <a href=3D"http://rwmj.wordpre=
ss.com" rel=3D"noreferrer noreferrer" target=3D"_blank">http://rwmj.wordpre=
ss.com</a><br>
virt-p2v converts physical machines to virtual machines.=C2=A0 Boot with a<=
br>
live CD or over the network (PXE) and turn machines into KVM guests.<br>
<a href=3D"http://libguestfs.org/virt-v2v" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://libguestfs.org/virt-v2v</a><br>
</blockquote></div></div></div>
</div></div></div></div></div>

--00000000000047cfd805889e9d9b--

