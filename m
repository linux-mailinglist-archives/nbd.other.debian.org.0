Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C787DC93
	for <lists+nbd@lfdr.de>; Sun, 17 Mar 2024 09:30:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CFF5220594; Sun, 17 Mar 2024 08:30:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar 17 08:30:14 2024
Old-Return-Path: <lauren@liebty.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SARE_XMAIL_BULK3a,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C483A20520
	for <lists-other-nbd@bendel.debian.org>; Sun, 17 Mar 2024 08:13:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=5.125 tagged_above=-10000 required=5.3
	tests=[BAYES_80=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, GMAIL=1,
	HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001, SARE_XMAIL_BULK3a=0.735,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dKY74TkWGzYV for <lists-other-nbd@bendel.debian.org>;
	Sun, 17 Mar 2024 08:13:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 465 seconds by postgrey-1.36 at bendel; Sun, 17 Mar 2024 08:13:22 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 43FDD20521
	for <nbd@other.debian.org>; Sun, 17 Mar 2024 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=liebty.com;
	s=xxsa2309; t=1710663198;
	bh=bgll9klUOTuyGwr1P2S8DeO9gwq4gPgsO4eDjUgTTqo=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=WcDb8Cxi4iH5sz7fXbTYAVW+xacZwNhdWKf9L7EOkKTm+hWKvmWJLdRdt+0QyQLhn
	 fZJQo5TtXFX8DjEN6kLaYZMO8Bv/sdxlUV4jYJtwAxH1VfoSDEzOLzGLlaark8chMI
	 nnS+kpdTopL9ZclZGXtdJ2QoaOeFdxsZFi11f7/U=
X-QQ-mid: bizesmtp80t1710662720tazlwwck
X-QQ-Originating-IP: IpcYaOmiG4q8UspkwlV5KHTMswSc0QaeSleptJn0aqk=
Received: from LAPTOP-HHF9I11D ( [36.21.151.213])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <nbd@other.debian.org>; Sun, 17 Mar 2024 16:05:20 +0800 (CST)
X-QQ-SSF: 01400000000000002000000A0000000
X-QQ-FEAT: k8Irs33ik7sAUsWdrQNOXttEmxxssZ9oy1opyTmodfHV/PFGr+WF5ncZrRktb
	E58YwJrtMbCSRKQ6t2DGIMqtGdFi2i7FSpqiiUeiRn+jeeKpIHklfOr9eQtRlRoEZ9JTX2B
	z1fWKJacMgyHtjwJ8OvEcBGlArxs5Puzy+KmD0v4NIN/itHPaXJcpZv01tZJQ0Cvt4grfSK
	2xsejAVGxfrjS2na3uFXXRJyRRd/3NQ+xDYiuO3PpRLpXdfOX2+twKeRIWvAvtfbN7V4QeD
	pIxXHZehOba/Rku4k5AcRWkpDzDn1bjPTEgiVUDgcPl90MjFmQbNh5gRKeLfF0x+epxzxMF
	mCujZY5RBkSnczpBsl+ZrB+6xA4Keb8RZkHpHmMxBuRDxwMkghaPczlkWFtASorCihgri1d
	GMO3cpRJt2xQt9Siiu1PMLQtJ+yRGzcRusU9s9T9pcQ=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 5177930887955476579
Date: Sun, 17 Mar 2024 16:04:55 +0800
From: "Lauren Pang" <lauren@liebty.com>
To: nbd <nbd@other.debian.org>
Subject: Construction machinery and spare parts are all available
X-Priority: 3
X-GUID: 56DDFF24-C00C-4C15-9BEC-56C7BD5BDF75
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.245[cn]
Mime-Version: 1.0
Message-ID: <829340F378C85052+2024031716043467163720@liebty.com>
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart186487466485_=----"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:liebty.com:qybglogicsvrgz:qybglogicsvrgz6a-0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KF8whoCvPlM.A.lYG.Woq9lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2781
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/829340F378C85052+2024031716043467163720@liebty.com
Resent-Date: Sun, 17 Mar 2024 08:30:14 +0000 (UTC)

This is a multi-part message in MIME format.

------=_001_NextPart186487466485_=----
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64

RGVhciBjdXN0b21lciwNCiANClRoaXMgaXMgTGF1cmVuIGZyb20gSGFuZ3pob3UsQ2hpbmEuTmlj
ZSB0byBtZWV0IHlvdS4NCiANCldlIGFyZSAxNS15ZWFyIGV4cGVyaWVuY2UgY29tcGFueSBzcGVj
aWFsaXplZCBpbiBleHBvcnRpbmcgZmFtb3VzIGJyYW5kcyBjb25zdHJ1Y3Rpb24gbWFjaGluZXJ5
IGFuZCBzcGFyZXMgcGFydHMsIGxpa2UgWENNRywgQ2F0ZXJwaWxsYXIsIFNhbnksIExpdWdvbmcs
IElTVVpVLCBIb3dvLCBEb25nZmVuZywgSGVsaSBhbmQgc28gb24gZm9yIG1vcmUgdGhhbiA1MCBi
cmFuZHMuDQogDQpMaWZ0aW5nIG1hY2hpbmVyeSwgUm9hZCBjb25zdHJ1Y3Rpb24sIFRydWNrJlNw
ZWNpYWwgdmVoaWNsZSwgTG9naXN0aWNzIG1hY2hpbmVyeSwgRWFydGhtb3ZpbmcgbWFjaGluZXJ5
LCBDb25jcmV0ZSBtYWNoaW5lcnksIERyaWxsaW5nIG1hY2hpbmVyeSBhbmQgQWdyaWN1bHR1cmFs
IG1hY2hpbmVyeSBwcm9kdWN0cywgZXRjIGFsbCBhdmFpbGFibGUuDQogDQpDb3VsZCB5b3UgcGxl
YXNlIGxlYXZlIHlvdXIgZW1haWwgYWRkcmVzcyBhbmQgcmVxdWlyZW1lbnRzIGhlcmU/IFRoZW4g
SSB3aWxsIHF1aWNrbHkgZ2l2ZSB5b3UgYSBxdW90YXRpb24gYXMgcGVyIHlvdXIgcmVxdWVzdC4N
CiANCkZvciBpbnN0YW50IHRhbGtpbmcsIHdoYXRzYXBwIG9yIHdlY2hhdCBhcmUgd2VsY29tZWQu
DQpQbGVhc2UgY29udGFjdCBtZSAyNC83IGlmIGFueSBuZWVkcy4NCiANCldoYXRzYXBwL1dlY2hh
dC9Nb2JpbGU6ICs4Ni0xNTE0NTMzNTgwNQ0KRS1tYWlsOiBsYXVyZW5wYW5nLmxpZWJ0eUBnbWFp
bC5jb20NCiANCkJlc3QgcmVnYXJkcw0KTGF1cmVuIFBhbmcNCiANCkxpZWJ0eSBNYWNoaW5lcnkg
VGVjaG5vbG9neSAoSGFuZ3pob3UpIENvLiwgTHRkLg0KTGllYnR5IEVxdWlwbWVudCBQdGUuIEx0
ZC4NCkFkZDogUm9vbSAyMDgsIEJ1aWxkaW5nIDMsIDE4NjYgQmlueGluZyBSb2FkLCBDaGFuZ2hl
IFN0cmVldCwgQmluamlhbmcgRGlzdHJpY3QsIEhhbmd6aG91LCBaaGVqaWFuZywgQ2hpbmENCg0K
DQoNCmxhdXJlbkBsaWVidHkuY29tDQo=

------=_001_NextPart186487466485_=----
Content-Type: text/html;
	charset="GB2312"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DGB2312"><style>body { line-height: 1.5; }p { margin-top: 0px; margin-b=
ottom: 0px; }body { font-size: 14px; font-family: "Microsoft YaHei UI"; co=
lor: rgb(0, 0, 0); line-height: 1.5; }</style></head><body>=0A<div><span><=
/span><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size:=
 10.5pt; text-align: justify; font-family: Calibri;"><span style=3D"font-f=
amily: Arial; font-size: 10.5pt;">Dear customer,</span><span style=3D"font=
-family: Arial; font-size: 10.5pt;"><o:p></o:p></span></p><p class=3D"MsoN=
ormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-align: j=
ustify; font-family: Calibri;"><span style=3D"font-family: Arial; font-siz=
e: 10.5pt;">&nbsp;</span></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0=
pt 0.0001pt; font-size: 10.5pt; text-align: justify; font-family: Calibri;=
"><span style=3D"font-family: Arial; font-size: 10.5pt;">This is&nbsp;</sp=
an><span style=3D"font-family: Arial; font-size: 10.5pt;">Lauren</span><sp=
an style=3D"font-family: Arial; font-size: 10.5pt;">&nbsp;from Hangzhou,Ch=
ina.Nice to meet you.</span><span style=3D"font-family: Arial; font-size: =
10.5pt;"><o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0pt=
 0pt 0.0001pt; font-size: 10.5pt; text-align: justify; font-family: Calibr=
i;"><span style=3D"font-family: Arial; font-size: 10.5pt;">&nbsp;</span></=
p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size: 10.=
5pt; text-align: justify; font-family: Calibri;"><span style=3D"font-famil=
y: Arial; font-size: 10.5pt;">We are 15-year experience company specialize=
d in exporting&nbsp;</span><span style=3D"font-family: Arial; font-size: 1=
0.5pt;">famous brands</span><span style=3D"font-family: Arial; font-size: =
10.5pt;">&nbsp;</span><span style=3D"font-family: Arial; font-size: 10.5pt=
;">c</span><span style=3D"font-family: Arial; font-size: 10.5pt;">onstruct=
ion machinery and spares parts,&nbsp;</span><span style=3D"font-family: Ar=
ial; font-size: 10.5pt;">l</span><span style=3D"font-family: Arial; font-s=
ize: 10.5pt;">ike XCMG, Caterpillar, Sany, Liugong, ISUZU, Howo, Dongfeng,=
 Heli and so on for more than 50 brands.</span><span style=3D"font-family:=
 Arial; font-size: 10.5pt;"><o:p></o:p></span></p><p class=3D"MsoNormal" s=
tyle=3D"margin: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-align: justify; =
font-family: Calibri;"><span style=3D"font-family: Arial; font-size: 10.5p=
t;">&nbsp;</span></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.000=
1pt; font-size: 10.5pt; text-align: justify; font-family: Calibri;"><span =
style=3D"font-family: Arial; font-size: 10.5pt;">Lifting machinery, Road c=
onstruction</span><span style=3D"font-family: Arial; font-size: 10.5pt;">,=
&nbsp;</span><span style=3D"font-family: Arial; font-size: 10.5pt;">Truck&=
amp;Special vehicle, Logistics machinery, Earthmoving machinery, Concrete =
machinery, Drilling machinery and Agricultural machinery products, etc all=
 available.</span><span style=3D"font-family: Arial; font-size: 10.5pt;"><=
o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.000=
1pt; font-size: 10.5pt; text-align: justify; font-family: Calibri;"><span =
style=3D"font-family: Arial; font-size: 10.5pt;">&nbsp;</span></p><p class=
=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-=
align: justify; font-family: Calibri;"><u><span style=3D"font-family: Aria=
l; font-size: 10.5pt;">Could you pl</span></u><u><span style=3D"font-famil=
y: Arial; font-size: 10.5pt;">ea</span></u><u><span style=3D"font-family: =
Arial; font-size: 10.5pt;">s</span></u><u><span style=3D"font-family: Aria=
l; font-size: 10.5pt;">e</span></u><u><span style=3D"font-family: Arial; f=
ont-size: 10.5pt;">&nbsp;leave your email address and requir</span></u><u>=
<span style=3D"font-family: Arial; font-size: 10.5pt;">e</span></u><u><spa=
n style=3D"font-family: Arial; font-size: 10.5pt;">ment</span></u><u><span=
 style=3D"font-family: Arial; font-size: 10.5pt;">s</span></u><u><span sty=
le=3D"font-family: Arial; font-size: 10.5pt;">&nbsp;here? Then I will quic=
kly give you a quotation as per your request.</span></u><u><span style=3D"=
font-family: Arial; font-size: 10.5pt;"><o:p></o:p></span></u></p><p class=
=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-=
align: justify; font-family: Calibri;"><span style=3D"font-family: Arial; =
font-size: 10.5pt;">&nbsp;</span></p><p class=3D"MsoNormal" style=3D"margi=
n: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-align: justify; font-family: =
Calibri;"><span style=3D"font-family: Arial; font-size: 10.5pt;">For insta=
nt talking, whats</span><span style=3D"font-family: Arial; font-size: 10.5=
pt;">a</span><span style=3D"font-family: Arial; font-size: 10.5pt;">pp or =
wechat are welcomed.</span><span style=3D"font-family: Arial; font-size: 1=
0.5pt;"><o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0pt =
0pt 0.0001pt; font-size: 10.5pt; text-align: justify; font-family: Calibri=
;"><span style=3D"font-family: Arial; font-size: 10.5pt;">Please contact m=
e 24/7 if any needs</span><span style=3D"font-family: Arial; font-size: 10=
.5pt;">.</span><span style=3D"font-family: Arial; font-size: 10.5pt;"><o:p=
></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt=
; font-size: 10.5pt; text-align: justify; font-family: Calibri;"><span sty=
le=3D"font-family: Arial; font-size: 10.5pt;">&nbsp;</span></p><p class=3D=
"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-ali=
gn: justify; font-family: Calibri;"><b><span style=3D"font-family: Arial; =
font-size: 10.5pt;">Whatsapp/Wechat/Mobile:&nbsp;+86-</span></b><b><span s=
tyle=3D"font-family: Arial; font-size: 10.5pt;">15145335805</span></b><b><=
span style=3D"font-family: Arial; font-size: 10.5pt;"><o:p></o:p></span></=
b></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size:=
 10.5pt; text-align: justify; font-family: Calibri;"><b><span style=3D"fon=
t-family: Arial; font-size: 10.5pt;">E-mail:</span></b><b><span style=3D"f=
ont-family: Arial; font-size: 10.5pt;">&nbsp;laurenpang</span></b><b><span=
 style=3D"font-family: Arial; font-size: 10.5pt;">.liebty@gmail.com</span>=
</b><b><span style=3D"font-family: Arial; font-size: 10.5pt;"><o:p></o:p><=
/span></b></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; fo=
nt-size: 10.5pt; text-align: justify; font-family: Calibri;"><b><span styl=
e=3D"font-family: Arial; font-size: 10.5pt;">&nbsp;</span></b></p><p class=
=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-=
align: justify; font-family: Calibri;"><span style=3D"font-family: Arial; =
font-size: 10.5pt;">Best regards</span><span style=3D"font-family: Arial; =
font-size: 10.5pt;"><o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"=
margin: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-align: justify; font-fam=
ily: Calibri;"><span style=3D"font-family: Arial; font-size: 10.5pt;">Laur=
en Pang</span><span style=3D"font-family: Arial; letter-spacing: 0pt; font=
-size: 10.5pt;"><o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"marg=
in: 0pt 0pt 0.0001pt; font-size: 10.5pt; text-align: justify; font-family:=
 Calibri;"><span style=3D"font-family: Arial; font-size: 10.5pt;">&nbsp;</=
span></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-si=
ze: 10.5pt; text-align: justify; font-family: Calibri;"><span style=3D"fon=
t-family: Arial; font-size: 10.5pt;">Liebty Machinery Technology (Hangzhou=
) Co., Ltd.</span><span style=3D"font-family: Arial; font-size: 10.5pt;"><=
o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.000=
1pt; font-size: 10.5pt; text-align: justify; font-family: Calibri;"><span =
style=3D"font-family: Arial; font-size: 10.5pt;">Liebty Equipment Pte. Ltd=
.</span><span style=3D"font-family: Arial; font-size: 10.5pt;"><o:p></o:p>=
</span></p><p class=3D"MsoNormal" style=3D"margin: 0pt 0pt 0.0001pt; font-=
size: 10.5pt; text-align: justify; font-family: Calibri;"><span style=3D"f=
ont-family: Arial; font-size: 10.5pt;">Add:&nbsp;Room 208, Building 3, 186=
6 Binxing Road, Changhe Street, Binjiang District, Hangzhou, Zhejiang, Chi=
na</span></p></div>=0A<div><br></div><hr style=3D"width: 210px; height: 1p=
x;" color=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><span><div style=
=3D"MARGIN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><div>lauren@liebt=
y.com</div></div></span></div>=0A</body></html>
------=_001_NextPart186487466485_=------

