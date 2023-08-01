Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC176B9AA
	for <lists+nbd@lfdr.de>; Tue,  1 Aug 2023 18:33:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F20BA20443; Tue,  1 Aug 2023 16:33:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  1 16:33:14 2023
Old-Return-Path: <matt.panaro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,FVGT_m_MULTI_ODD,HTML_MESSAGE,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 24CC92047F
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Aug 2023 16:17:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.931 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FREEMAIL_FROM=0.001,
	FVGT_m_MULTI_ODD=0.02, HTML_MESSAGE=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id szrSVR8Is5aZ for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Aug 2023 16:17:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4CEAD20477
	for <nbd@other.debian.org>; Tue,  1 Aug 2023 16:17:11 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-447abf05ea4so206741137.0
        for <nbd@other.debian.org>; Tue, 01 Aug 2023 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690906628; x=1691511428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EsT1sNWlD7AoulItQmnGNNkhEc4oANAA2LMzIMw9JkU=;
        b=CfP5lgOhnSIXQdUtc5v4Pihr8jN4JRFD8UU4Xk4NMdF1Sggv/FgHyrQqSGFHVyikhY
         G9Dxjr/eRSsYF5CA1ybbjhq+GlXNA7tRAz+TIpraHxMMWCXB6CGeOjYS0lsjM4ZKi3q7
         5Fwwg7P986KCT6Kq7IIBjksEypk0epWGrhJb7POa6ytECrSgbr1K0yf2vBqPahxu4JF+
         NDbtWkpmTB9d/Szpqp3ukwm6lZJ3QYkP+MFwMZSb0LvE3HugA/iyO/HSqXmobNgycgb8
         aN6ctDMhNXK3yBawO0ngjpNdxB7PAIfngCbZc2WJ+EVxPErBKFy7M8RLvuIXrQZAvBZi
         z1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690906628; x=1691511428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsT1sNWlD7AoulItQmnGNNkhEc4oANAA2LMzIMw9JkU=;
        b=Pm/lpL+aop+KnoHp+RZY9B2x0gMqIfMV07QSk/2GfMQGhSkBTY01Fkg7135maONEs1
         ufFA5TUkCCUckBGpNivs9i3NtEkWEOImsP2bWF0cvwoxKZDzAp3d4NKfZFE9uuaXW38Y
         PKeUYdd2cOHupgUF3JNYGGsyFUVoWnNHlh9/KwH+CFF6SlHlFQZBa/9Ny+2pjaqXCEE7
         uB6ACox7JprSs+hYBdo8o9bMgH/XAtUgWEgMw60riSuuTvdiAUDVsyf7911W/16uoKfK
         cs0NBfyqMn+FcO+uZ4Ch11wfg9oKHe09AShmIJFW8aHYD/wkW0Cao6QxgZfNLRe+mRKB
         TNxg==
X-Gm-Message-State: ABy/qLaAosQzwixjYYkUrd7Wej8Vl6FjYm1nr60FjYo9doCd7zGX49/a
	l27co7+mfMeWBSbxjQk28WnvNUuTc/4y6ir2fiBw1I0k
X-Google-Smtp-Source: APBJJlH58bNnpj73kuVt+cRwyWsM3IHNX3QddQ5XxmUXOI6v1muA21/KSDUh8O5ZLCke//CjHaIgpuEUPLFoKSPUlyM=
X-Received: by 2002:a67:ebc3:0:b0:443:5b1f:12e4 with SMTP id
 y3-20020a67ebc3000000b004435b1f12e4mr1918461vso.9.1690906627768; Tue, 01 Aug
 2023 09:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com>
 <ZMkHk3buC5qskubT@pc220518.home.grep.be>
In-Reply-To: <ZMkHk3buC5qskubT@pc220518.home.grep.be>
From: Matt Panaro <matt.panaro@gmail.com>
Date: Tue, 1 Aug 2023 12:16:55 -0400
Message-ID: <CAAki=DVAvo3OxusJDkErPifHwnPOgW=SEj=5zja34Djr9ARajQ@mail.gmail.com>
Subject: Re: [PATCH] fix missing -F short-option for certfile [version 2]
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="000000000000e583c10601dee0a6"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pcLnj9ry-UB.A.N0F.KPTykB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2587
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAki=DVAvo3OxusJDkErPifHwnPOgW=SEj=5zja34Djr9ARajQ@mail.gmail.com
Resent-Date: Tue,  1 Aug 2023 16:33:14 +0000 (UTC)

--000000000000e583c10601dee0a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

so when I did `git format-patch`, I omitted the bottom 2 lines from the
output in the email (it was a string of 3 hyphens, and the git-version,
IIRC): are those mandatory?
I can either put a snippet on github and send the link; or I could try
opening up an actual PR on GitHub, if that's permissible; or I can try
replying again w/ the full/unadulterated `format-patch` output in the body
of hte email (I think I also removed the subject-line from the output and
put it directly in the email subject-line? maybe I should've just left
everything as-was; too used to github's workflow)

On Tue, Aug 1, 2023 at 9:24=E2=80=AFAM Wouter Verhelst <w@uter.be> wrote:

> Hi Matt,
>
> This patch doesn't apply, possibly because your mail client mangled
> whitespace
> or some such (but I'm not 100% sure).
>
> Two ways out of this:
>
> - Use "git send-email", which will automate sending the message for you;
> - If you have the patch public somewhere, let me know where and I'll
>   just pull.
>
> Thanks.
>
> On Mon, Jul 31, 2023 at 05:01:09PM -0400, Matt Panaro wrote:
> > see previous thread: https://lists.debian.org/nbd/2023/07/msg00021.html
> > for the motivation behind this refactor
> >
> > in commit 1b8615, the `-F` short-option was accidentally refactored out
> of
> > the codebase, so that only the long-option for `-certfile` would work.
> > This commit restores the `-F` short-option, as well as conditionally
> > populating the `short_opts` string based on compilation-options for
> > `NETLINK` and `GNUTLS`
> > ---
> >  nbd-client.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/nbd-client.c b/nbd-client.c
> > index dae4636..ac0419d 100644
> > --- a/nbd-client.c
> > +++ b/nbd-client.c
> > @@ -896,11 +896,14 @@ void disconnect(char* device) {
> >         close(nbd);
> >  }
> >
> > +static const char *short_opts =3D "-B:b:c:d:gH:hlnN:PpRSst:uVx"
> >  #if HAVE_NETLINK
> > -static const char *short_opts =3D "-A:B:b:c:C:d:gH:hK:LlnN:PpRSst:uVx"=
;
> > -#else
> > -static const char *short_opts =3D "-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx";
> > +       "L"
> > +#endif
> > +#if HAVE_GNUTLS
> > +       "A:C:F:K:"
> >  #endif
> > +       ;
> >
> >  int main(int argc, char *argv[]) {
> >         char* port=3DNBD_DEFAULT_PORT;
>
> --
>      w@uter.{be,co.za}
> wouter@{grep.be,fosdem.org,debian.org}
>
> I will have a Tin-Actinium-Potassium mixture, thanks.
>

--000000000000e583c10601dee0a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>so when I did `git format-patch`, I omitted the botto=
m 2 lines from the output in the email (it was a string of 3 hyphens, and t=
he git-version, IIRC): are those mandatory?</div><div>I can either put a sn=
ippet on github and send the link; or I could try opening up an actual PR o=
n GitHub, if that&#39;s permissible; or I can try replying again w/ the ful=
l/unadulterated `format-patch` output in the body of hte email (I think I a=
lso removed the subject-line from the output and put it directly in the ema=
il subject-line? maybe I should&#39;ve just left everything as-was; too use=
d to github&#39;s workflow)<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 1, 2023 at 9:24=E2=80=AFAM=
 Wouter Verhelst &lt;<a href=3D"mailto:w@uter.be">w@uter.be</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Matt,<br>
<br>
This patch doesn&#39;t apply, possibly because your mail client mangled whi=
tespace<br>
or some such (but I&#39;m not 100% sure).<br>
<br>
Two ways out of this:<br>
<br>
- Use &quot;git send-email&quot;, which will automate sending the message f=
or you;<br>
- If you have the patch public somewhere, let me know where and I&#39;ll<br=
>
=C2=A0 just pull.<br>
<br>
Thanks.<br>
<br>
On Mon, Jul 31, 2023 at 05:01:09PM -0400, Matt Panaro wrote:<br>
&gt; see previous thread: <a href=3D"https://lists.debian.org/nbd/2023/07/m=
sg00021.html" rel=3D"noreferrer" target=3D"_blank">https://lists.debian.org=
/nbd/2023/07/msg00021.html</a><br>
&gt; for the motivation behind this refactor<br>
&gt; <br>
&gt; in commit 1b8615, the `-F` short-option was accidentally refactored ou=
t of<br>
&gt; the codebase, so that only the long-option for `-certfile` would work.=
<br>
&gt; This commit restores the `-F` short-option, as well as conditionally<b=
r>
&gt; populating the `short_opts` string based on compilation-options for<br=
>
&gt; `NETLINK` and `GNUTLS`<br>
&gt; ---<br>
&gt;=C2=A0 nbd-client.c | 9 ++++++---<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/nbd-client.c b/nbd-client.c<br>
&gt; index dae4636..ac0419d 100644<br>
&gt; --- a/nbd-client.c<br>
&gt; +++ b/nbd-client.c<br>
&gt; @@ -896,11 +896,14 @@ void disconnect(char* device) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(nbd);<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; +static const char *short_opts =3D &quot;-B:b:c:d:gH:hlnN:PpRSst:uVx&q=
uot;<br>
&gt;=C2=A0 #if HAVE_NETLINK<br>
&gt; -static const char *short_opts =3D &quot;-A:B:b:c:C:d:gH:hK:LlnN:PpRSs=
t:uVx&quot;;<br>
&gt; -#else<br>
&gt; -static const char *short_opts =3D &quot;-A:B:b:c:C:d:gH:hK:lnN:PpRSst=
:uVx&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;L&quot;<br>
&gt; +#endif<br>
&gt; +#if HAVE_GNUTLS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;A:C:F:K:&quot;<br>
&gt;=C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0;<br>
&gt; <br>
&gt;=C2=A0 int main(int argc, char *argv[]) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char* port=3DNBD_DEFAULT_PORT;<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0w@uter.{be,<a href=3D"http://co.za" rel=3D"noreferrer" =
target=3D"_blank">co.za</a>}<br>
wouter@{<a href=3D"http://grep.be" rel=3D"noreferrer" target=3D"_blank">gre=
p.be</a>,<a href=3D"http://fosdem.org" rel=3D"noreferrer" target=3D"_blank"=
>fosdem.org</a>,<a href=3D"http://debian.org" rel=3D"noreferrer" target=3D"=
_blank">debian.org</a>}<br>
<br>
I will have a Tin-Actinium-Potassium mixture, thanks.<br>
</blockquote></div>

--000000000000e583c10601dee0a6--

