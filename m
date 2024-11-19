Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 215249D2E6C
	for <lists+nbd@lfdr.de>; Tue, 19 Nov 2024 19:57:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CD5662061E; Tue, 19 Nov 2024 18:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 18:57:10 2024
Old-Return-Path: <0100019345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000@mail.pendletonfamilybrands.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=4.0 tests=AVAILABLENOW,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SARE_HTML_COLOR_NWHT autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C285F20624
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2024 18:39:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.427 tagged_above=-10000 required=5.3
	tests=[AVAILABLENOW=1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=2,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SARE_HTML_COLOR_NWHT=0.623]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xWH6vtqPUh4O for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2024 18:38:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 364 seconds by postgrey-1.36 at bendel; Tue, 19 Nov 2024 18:38:54 UTC
Received: from a9-33.smtp-out.amazonses.com (a9-33.smtp-out.amazonses.com [54.240.9.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7CF47205F0
	for <nbd@other.debian.org>; Tue, 19 Nov 2024 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=l74ybolohuee6dvnnsh3fupoedrhottp; d=pendletonfamilybrands.com;
	t=1732041166;
	h=Content-Type:MIME-Version:Subject:From:To:Date:Message-ID:List-Unsubscribe;
	bh=y18FQFDU+nmzvYcZW/sIygzV0uXhK/tqziUeNo5k91I=;
	b=jveo839TFp8Gjvwt5lyOGwT9wjHPpchZuoK2dvvhn8pk0H4cYPiUvPpR6uA76P0N
	75PG6I0ss1MAjfoB4+549YbYCRNApA2TsMPnOkFP6uxKIVzSkknaWnfqBOC6mmBrK3M
	VVWurk8PfKK7WxSnl2Rf22EyMu/Nxlmy19CWWhlykaGZ9V7pIvsRWPU1mnMOeDZIXIw
	Y4yh0gKz9oqVqg19527t13aBCLsoWHLjn4X55XGx5qXwsTnqaJyCzPNeWBflNnxP+6X
	ceNVt/tLp5rrWye1ZG3LNZJFIivdYhHNJ79FJJRMkcruoKQz91nGi9McLCWLak7ZsO6
	vdYkDITb8Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1732041166;
	h=Content-Type:MIME-Version:Subject:From:To:Date:Message-ID:List-Unsubscribe:Feedback-ID;
	bh=y18FQFDU+nmzvYcZW/sIygzV0uXhK/tqziUeNo5k91I=;
	b=fRasHXsqdQd3AI1Eck2WS0BFFX5hItKgk6sTvZ1Pm2elRYKGezD4BQZ1ac43JK3b
	kD+KHf9B6NWFzYlkGxf94rO935tXqLBTU+4EJYEjaVt+Y/IKe+6kjUHMT6owG7AU+nr
	C+FDMCIdqAWiYS44eQI6sTtO1u/Tn6omzJVD5PFM=
Content-Type: multipart/alternative;
 boundary="===============7912076267288228716=="
MIME-Version: 1.0
Subject: Early Black Friday. Upgrade Your Safe Game!
From: Pendleton <bulletin@pendletonfamilybrands.com>
To: nbd@other.debian.org
Date: Tue, 19 Nov 2024 18:32:46 +0000
Message-ID: <0100019345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000@email.amazonses.com>
X-Entity-Ref-ID: 53f6bb55-856b-437a-a394-d17737cddbdf
X-Tenant: 508969632888
Feedback-ID: ::1.us-east-1.8WW+rbOmWAYK89lAwGZMehvPCMaIZCDedFyFCciu3dU=:AmazonSES
X-SES-Outgoing: 2024.11.19-54.240.9.33
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tTsBo0LByQJ.A.es7H.G-NPnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3190
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0100019345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000@email.amazonses.com
Resent-Date: Tue, 19 Nov 2024 18:57:10 +0000 (UTC)

--===============7912076267288228716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

### [![Pendleton Family Brands](https://images.pendletonfamilybrands.com/ec/ec/i/h67sdm_3-rt9S82Dvd0tILnksW8=/3226449372/height-100/)](https://www.pendletonfamilybrands.com/discount/EBF24?redirect=%2Fproducts%2Fst-plus)&lt;br/&gt;Why Choose Pendleton?

[![Stronghold ST Plus Testimonial Photo](https://images.pendletonfamilybrands.com/ec/ec/i/LpwE_B9txQawm2Em3rl0SIGRAj0=/4605854065/width-600/)](https://www.pendletonfamilybrands.com/discount/EBF24?redirect=%2Fproducts%2Fst-plus)
&gt; I&#x27;ve been on the hunt for a sturdy and reliable safe for years. I finally found what I was looking for. I couldn&#x27;t think of another brand I would trust more than Pendleton&lt;br/&gt;-- Real Customer Feedback

### Stronghold ST Plus Series Safes
Accommodates 26 Long Guns Plus Handgun Storage. Features Fast &amp; Easy Access To Your Valuables With Pendleton&#x27;s Revolving Gun Management System, Lights, Mositure Control, and Valuables Storage. Opens Quickly With An EMP-Resistant Electronic Lock So You&#x27;re Always Prepared.

### Order Yours Today
Early Black Friday discount code EBF24 is available now for Stronghold ST Plus safes. [Order Factory Direct Online](https://www.pendletonfamilybrands.com/discount/EBF24?redirect=%2Fproducts%2Fst-plus) or by Phone at 770-466-6181. Discount will be shown at checkout online. Take advantage now - discount EBF24 offers the lowest price that will be available. Limited supply available so don&#x27;t miss out!

### Revolving Gun Management&lt;br/&gt;Video Demonstration
![Revolving Safe Video](https://content.pendletonfamilybrands.com/pages/bulletin/promotions/2024/early-black-friday-upgrade-your-safe-game/i/c2d981c0-506b-446e-80e6-35a613393483/?loop&amp;autoplay)

(*click the video above to see the concept in action*)
View this email in your browser: https://content.pendletonfamilybrands.com/pages/bulletin/promotions/2024/early-black-friday-upgrade-your-safe-game/i/c2d981c0-506b-446e-80e6-35a613393483/
Copyright © 2024 PENDLETON FAMILY BRANDS, All rights reserved.
You are receiving this email because you've opted in for announcements and special offers
Our mailing address is:
PENDLETON FAMILY BRANDS
PO BOX 2506
LOGANVILLE, GA 30052 US
Want to stop receiving these emails? You can unsubscribe: https://content.pendletonfamilybrands.com/pages/bulletin/promotions/2024/early-black-friday-upgrade-your-safe-game/i/c2d981c0-506b-446e-80e6-35a613393483/s/
--===============7912076267288228716==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html lang=3D"en-us" style=3D"text-align:center; font-size:18px; max-width:=
100%" align=3D"center">
    <head style=3D"text-align:center" align=3D"center">
        <title style=3D"text-align:center" align=3D"center">Early Black Fri=
day. Upgrade Your Safe Game!</title>
        <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Du=
tf-8" style=3D"text-align:center" align=3D"center">
        <meta name=3D"robots" content=3D"none" style=3D"text-align:center" =
align=3D"center">
        <meta name=3D"viewport" content=3D"width=3Ddevice-width" style=3D"t=
ext-align:center" align=3D"center">
       =20
   =20
       =20
   =20
<link rel=3D"preload" as=3D"font" href=3D"https://static.pendletonfamilybra=
nds.com/ec/ec/f/907fff15-9764-455a-a0a2-964c3aa3a534/woff2/907fff15-9764-45=
5a-a0a2-964c3aa3a534-a013c49b28_SdhXfP0.woff2" crossorigin style=3D"text-al=
ign:center" align=3D"center">

   =20
    <style type=3D"text/css" style=3D"text-align:center" align=3D"center">@=
media print {
    *, *:before, *:after {
        background: transparent;
        color: #000;
        box-shadow: none;
        text-shadow: none
        }
    a, a:visited {
        text-decoration: underline
        }
    a[href]:after {
        content: " (" attr(href) ")"
        }
    abbr[title]:after {
        content: " (" attr(title) ")"
        }
    a[href^=3D"#"]:after, a[href^=3D"javascript:"]:after {
        content: ""
        }
    pre, blockquote {
        border: 1px solid #999;
        page-break-inside: avoid
        }
    thead {
        display: table-header-group
        }
    tr, img {
        page-break-inside: avoid
        }
    img {
        max-width: 100%
        }
    p, h2, h3 {
        orphans: 3;
        widows: 3
        }
    h2, h3 {
        page-break-after: avoid
        }
    }
@media screen and (min-width: 32rem) and (max-width: 48rem) {
    html {
        font-size: 15px
        }
    }
@media screen and (min-width: 48rem) {
    html {
        font-size: 16px
        }
    }
*:not(div):not(img):not(body):not(html):not(li):not(blockquote):not(p) {mar=
gin:1rem auto 1rem;max-width:36rem;padding:0.25rem}
a:visited {color:#3498db}
a:hover {color:#2980b9}
a:focus {color:#2980b9}
a:active {color:#2980b9}</style>
</head>
    <body style=3D"text-align:center; line-height:1.85; color:#444; font-fa=
mily:ForzaBold, Georgia, serif; margin:0; max-width:100%" align=3D"center">
<span style=3D"text-align:center; display:none !important; font-size:1px; l=
ine-height:1px; max-height:0; max-width:0; mso-hide:all; opacity:0; overflo=
w:hidden; visibility:hidden" align=3D"center">Pendleton Offers Fast &amp; E=
asy Access To Your Collection!</span><span style=3D"text-align:center; disp=
lay:none !important; font-size:1px; line-height:1px; max-height:0; max-widt=
h:0; mso-hide:all; opacity:0; overflow:hidden; visibility:hidden" align=3D"=
center">=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C</span><a class=3D"view-in-browser" href=3D"https://yjhwpfc5.r.us-=
east-1.awstrack.me/L0/https:%2F%2Fcontent.pendletonfamilybrands.com%2Fpages=
%2Fbulletin%2Fpromotions%2F2024%2Fearly-black-friday-upgrade-your-safe-game=
%2Fi%2Fc2d981c0-506b-446e-80e6-35a613393483%2F/1/0100019345b2cf35-3f344d12-=
0f7f-4bbd-af00-ffb229b7dcc5-000000/L4Zlwc-eke9BfL0Lah25FdRMGSs=3D401" style=
=3D"text-align:center; color:#3498db" align=3D"center">View this email in y=
our browser</a>
        <img src=3D"https://content.pendletonfamilybrands.com/pt/smXjLYN3PY=
StMfa_ccNPwFcC_Dd8lWziN57NWSKFpk7yOYW6oPWv63-JNSA29GWGd0WANA-7csM6jY_3Dxn5P=
9a3y4wAy0OLwUFjxWTGknfHVPjJiKHmMNFX__W36sZBaFNzRkkrBJsDq6jCSGoj48R92YEycup-=
6ORCCLPr7ODvl00=3D/" width=3D"1" height=3D"1" style=3D"text-align:center; m=
ax-width:100%" align=3D"center"><h3 style=3D"text-align:center; font-weight=
:inherit; line-height:1.42; font-size:1.999rem" align=3D"center">
<a href=3D"https://yjhwpfc5.r.us-east-1.awstrack.me/L0/https:%2F%2Fwww.pend=
letonfamilybrands.com%2Fdiscount%2FEBF24%3Fredirect=3D%252Fproducts%252Fst-=
plus/1/0100019345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000/caF2I4S=
NPFyJXg4N5QhzB1t-nrE=3D401" style=3D"text-align:center; color:#3498db" alig=
n=3D"center"><img alt=3D"Pendleton Family Brands" src=3D"https://images.pen=
dletonfamilybrands.com/ec/ec/i/h67sdm_3-rt9S82Dvd0tILnksW8=3D/3226449372/he=
ight-100/" style=3D"text-align:center; max-width:100%" align=3D"center"></a=
><br style=3D"text-align:center" align=3D"center">Why Choose Pendleton?</h3=
>
<p style=3D"text-align:center; font-size:1rem; margin-bottom:1.3rem; margin=
:1rem auto 1rem; max-width:36rem; padding:0.25rem; color:#555; height:auto;=
 line-height:1.45" align=3D"center" height=3D"auto"><a href=3D"https://yjhw=
pfc5.r.us-east-1.awstrack.me/L0/https:%2F%2Fwww.pendletonfamilybrands.com%2=
Fdiscount%2FEBF24%3Fredirect=3D%252Fproducts%252Fst-plus/2/0100019345b2cf35=
-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000/AVmUKcXET6QO39QJoxBt0ve6Ulw=3D=
401" style=3D"text-align:center; color:#3498db" align=3D"center"><img alt=
=3D"Stronghold ST Plus Testimonial Photo" src=3D"https://images.pendletonfa=
milybrands.com/ec/ec/i/LpwE_B9txQawm2Em3rl0SIGRAj0=3D/4605854065/width-600/=
" style=3D"text-align:center; max-width:100%" align=3D"center"></a></p>
<blockquote style=3D"text-align:center" align=3D"center">
<p style=3D"text-align:center; font-size:1.5rem; margin-bottom:1.3rem; marg=
in:1rem auto 1rem; max-width:48rem; padding:0.25rem; color:#555; height:aut=
o; line-height:1.45; font-style:italic" align=3D"center" height=3D"auto">I'=
ve been on the hunt for a sturdy and reliable safe for years. I finally fou=
nd what I was looking for. I couldn't think of another brand I would trust =
more than Pendleton<br style=3D"text-align:center" align=3D"center">-- Real=
 Customer Feedback</p>
</blockquote>
<h3 style=3D"text-align:center; font-weight:inherit; line-height:1.42; font=
-size:1.999rem" align=3D"center">Stronghold ST Plus Series Safes</h3>
<p style=3D"text-align:center; font-size:1rem; margin-bottom:1.3rem; margin=
:1rem auto 1rem; max-width:36rem; padding:0.25rem; color:#555; height:auto;=
 line-height:1.45" align=3D"center" height=3D"auto">Accommodates 26 Long Gu=
ns Plus Handgun Storage. Features Fast &amp; Easy Access To Your Valuables =
With Pendleton's Revolving Gun Management System, Lights, Mositure Control,=
 and Valuables Storage. Opens Quickly With An EMP-Resistant Electronic Lock=
 So You're Always Prepared.</p>
<h3 style=3D"text-align:center; font-weight:inherit; line-height:1.42; font=
-size:1.999rem" align=3D"center">Order Yours Today</h3>
<p style=3D"text-align:center; font-size:1rem; margin-bottom:1.3rem; margin=
:1rem auto 1rem; max-width:36rem; padding:0.25rem; color:#555; height:auto;=
 line-height:1.45" align=3D"center" height=3D"auto">Early Black Friday disc=
ount code EBF24 is available now for Stronghold ST Plus safes. <a href=3D"h=
ttps://yjhwpfc5.r.us-east-1.awstrack.me/L0/https:%2F%2Fwww.pendletonfamilyb=
rands.com%2Fdiscount%2FEBF24%3Fredirect=3D%252Fproducts%252Fst-plus/3/01000=
19345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000/LwtT9FRuzNzdDkQVA4Q=
gy98og64=3D401" style=3D"text-align:center; color:#3498db" align=3D"center"=
>Order Factory Direct Online</a> or by Phone at 770-466-6181. Discount will=
 be shown at checkout online. Take advantage now - discount EBF24 offers th=
e lowest price that will be available. Limited supply available so don't mi=
ss out!</p>
<h3 style=3D"text-align:center; font-weight:inherit; line-height:1.42; font=
-size:1.999rem" align=3D"center">Revolving Gun Management<br style=3D"text-=
align:center" align=3D"center">Video Demonstration</h3>
<p style=3D"text-align:center; font-size:1rem; margin-bottom:1.3rem; margin=
:1rem auto 1rem; max-width:36rem; padding:0.25rem; color:#555; height:auto;=
 line-height:1.45" align=3D"center" height=3D"auto"><a class=3D"multimedia"=
 href=3D"https://yjhwpfc5.r.us-east-1.awstrack.me/L0/https:%2F%2Fcontent.pe=
ndletonfamilybrands.com%2Fpages%2Fbulletin%2Fpromotions%2F2024%2Fearly-blac=
k-friday-upgrade-your-safe-game%2Fi%2Fc2d981c0-506b-446e-80e6-35a613393483%=
2F/2/0100019345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000/R8DJVpkx_=
eTZt_P7hfIhQXKubUk=3D401" style=3D"text-align:center; color:#3498db" align=
=3D"center"><img alt=3D"Revolving Safe Video" src=3D"https://content.pendle=
tonfamilybrands.com/ec/multimedia/embed/3724690534/inbox/" style=3D"text-al=
ign:center; max-width:100%" align=3D"center"></a></p>
<p style=3D"text-align:center; font-size:1rem; margin-bottom:1.3rem; margin=
:1rem auto 1rem; max-width:36rem; padding:0.25rem; color:#555; height:auto;=
 line-height:1.45" align=3D"center" height=3D"auto">(<em style=3D"text-alig=
n:center" align=3D"center">click the video above to see the concept in acti=
on</em>)</p>
       =20
            <div class=3D"footer" style=3D"text-align:center; width:100%; b=
order-top:solid 1px #000; margin-top:5em" align=3D"center" width=3D"100%">
    <p class=3D"copyright" style=3D"text-align:center; font-size:1rem; marg=
in-bottom:1.3rem; margin:1rem auto 1rem; max-width:36rem; padding:0.25rem; =
color:#555; height:auto; line-height:1.45" align=3D"center" height=3D"auto"=
>
    Copyright =C2=A9 2024 PENDLETON FAMILY BRANDS, All rights reserved.
</p>
    <p class=3D"reminder" style=3D"text-align:center; font-size:1rem; margi=
n-bottom:1.3rem; margin:1rem auto 1rem; max-width:36rem; padding:0.25rem; c=
olor:#555; height:auto; line-height:1.45" align=3D"center" height=3D"auto">=
You are receiving this email because you've opted in for announcements and =
special offers</p>
    <div class=3D"physical-location" style=3D"text-align:center; width:100%=
" align=3D"center" width=3D"100%">
    Our mailing address is:
    <pre style=3D'text-align:center; font-family:Menlo, Monaco, "Courier Ne=
w", monospace; background-color:#fafafa; font-size:0.8rem; overflow-x:scrol=
l; padding:1.125em; background:transparent; overflow:visible; text-transfor=
m:uppercase' align=3D"center" bgcolor=3D"#fafafa">PENDLETON FAMILY BRANDS
PO BOX 2506
LOGANVILLE, GA 30052 US</pre>
</div>
   =20
<div class=3D"unsubscribe" style=3D"text-align:center; width:100%" align=3D=
"center" width=3D"100%">
    <p style=3D"text-align:center; font-size:1rem; margin-bottom:1.3rem; ma=
rgin:1rem auto 1rem; max-width:36rem; padding:0.25rem; color:#555; height:a=
uto; line-height:1.45" align=3D"center" height=3D"auto">Want to stop receiv=
ing these emails?</p>
    <p style=3D"text-align:center; font-size:1rem; margin-bottom:1.3rem; ma=
rgin:1rem auto 1rem; max-width:36rem; padding:0.25rem; color:#555; height:a=
uto; line-height:1.45" align=3D"center" height=3D"auto">You can <a href=3D"=
https://yjhwpfc5.r.us-east-1.awstrack.me/L0/https:%2F%2Fcontent.pendletonfa=
milybrands.com%2Fpages%2Fbulletin%2Fpromotions%2F2024%2Fearly-black-friday-=
upgrade-your-safe-game%2Fi%2Fc2d981c0-506b-446e-80e6-35a613393483%2Fs%2F/1/=
0100019345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000/7d0QzWc38pB8ln=
PJ9BNMSQhhvdU=3D401" style=3D"text-align:center; color:#3498db" align=3D"ce=
nter">unsubscribe</a>.</p>
</div>

</div>
       =20
    <img alt=3D"" src=3D"https://yjhwpfc5.r.us-east-1.awstrack.me/I0/010001=
9345b2cf35-3f344d12-0f7f-4bbd-af00-ffb229b7dcc5-000000/_heG7KgSwL7tF1WoLrmz=
crsMwKs=3D401" style=3D"display: none; width: 1px; height: 1px;">
</body>
</html>

--===============7912076267288228716==--

