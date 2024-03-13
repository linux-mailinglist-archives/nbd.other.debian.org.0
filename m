Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072F87A3A1
	for <lists+nbd@lfdr.de>; Wed, 13 Mar 2024 08:36:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CC64F20E5D; Wed, 13 Mar 2024 07:36:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 13 07:36:16 2024
Old-Return-Path: <CHLI30@nuvoton.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HTML_MESSAGE,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0195720E32
	for <lists-other-nbd@bendel.debian.org>; Wed, 13 Mar 2024 07:20:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.789 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, HTML_MESSAGE=2, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RGm4zFFpTjW6 for <lists-other-nbd@bendel.debian.org>;
	Wed, 13 Mar 2024 07:20:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .nuvoton. - helo: .apc01-sg2-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 12843 seconds by postgrey-1.36 at bendel; Wed, 13 Mar 2024 07:20:17 UTC
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2043.outbound.protection.outlook.com [40.107.215.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 08AD920E3E
	for <nbd@other.debian.org>; Wed, 13 Mar 2024 07:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzIOXivMjeyGIAeSPS+yQ51gQjL28GYnpXZk/QSbs3drZQzdUBSBCq4lzr7e0N5XMrIF4z+Wj9hXbQ4GPdk0t0SydKl4QgnmsAHbJuevPuN2FDUjfNuY0EBavhQXItYGPpTFllEkQslsm8oAG/2WiHmz2SWT5midEvam6x/MJF/6vS+lraoVBzuPsFeNhdH3VU4jfm//dI0rwUKDGpXei1A9fPh4RBGlLHHTe47oklRn7B8990Ytmr5CgnywwrQPeTX3Pk7S1K+Ys/k7/YrjjO90TM7YhJUIHO4u5zbvnBfJLXjl/X0e8vz86ZMuaOfniXSQ/s41sgMgcGP28FLWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4y53XQKat6an/zo7nS78mY27zawLzJ4ZXmNYVWdAeA=;
 b=llVIt0iizM3CD+Ar8WGaHDq/rIKB9KJSOUIxArO0BhTJCCTtLqmSxpHFVAnTPGTXmkVDoiG4/24LdDqJtc/q0+k6dhsqlOWb68VJBYNqmLcLj+m1IWyCBuI1HbY+xjH9kM2nBkoOaRgWQA0hkSFB5OR18cfw1IRS6kmCyjw5n2epXq36Crrtef8cRLoVgk09TRIoMGVn6UHJHU7PqmmZ080KP6lC3X4cqd1qf5GxO/SWPEXwZJf8xG1sZGA2K1mPuCGziUigi4JbxUCf58G2xKrXJydDaOxFd9J9D/RdfAiQnUZVLuJiK6gGz25BpK2nr5q/Ml25wIKGbtxAsCa/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4y53XQKat6an/zo7nS78mY27zawLzJ4ZXmNYVWdAeA=;
 b=Wp73P5zsqOzS6IacxP6mExswQeR/vsbCD3uXioozQ1o3073574yMjJwBeNd2+G+GwqtbdjjmA0qrSc+ZZxO5eAo6KSoM44VpOHBEjfcWscNPWx9dRHzgavl7B0qsbVxCg2bIkWQhlG+93UJnk33LyekvORR6jnXozpk1h03MoVM=
Received: from JH0PR03MB8099.apcprd03.prod.outlook.com (2603:1096:990:35::10)
 by TYSPR03MB8058.apcprd03.prod.outlook.com (2603:1096:400:472::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 03:46:06 +0000
Received: from JH0PR03MB8099.apcprd03.prod.outlook.com
 ([fe80::52e1:e35d:51b9:aaeb]) by JH0PR03MB8099.apcprd03.prod.outlook.com
 ([fe80::52e1:e35d:51b9:aaeb%4]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 03:46:06 +0000
From: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
To: "nbd@other.debian.org" <nbd@other.debian.org>
CC: Tim Lee <timlee660101@gmail.com>
Subject: NBD export fail "nbd0: truncated" to mount with block size other than
 512
Thread-Topic: NBD export fail "nbd0: truncated" to mount with block size other
 than 512
Thread-Index: Adp0+HiL+SXyc4RVSXCA2JrlWucTyA==
Date: Wed, 13 Mar 2024 03:46:05 +0000
Message-ID:
 <JH0PR03MB80990893203BE2EF0445E66BCF2A2@JH0PR03MB8099.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8099:EE_|TYSPR03MB8058:EE_
x-ms-office365-filtering-correlation-id: 62021057-e217-4da9-28ba-08dc43101c83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zbcRcGfSynYk4cxTiNz3hYDHyUmL6sq+HmlhU5R7XwWOp53tARkSbmwV9Y9PwjB4Tzm6dZRPGQ8SdxKd3Hbyp4JNq1PwED9DdFcesHki6+DRuMNKniRLcWcY2B05TTtQs18atAZTsA7QzeXFSyS0t4K3Jia+IdBumKkXvR/KoQ0once/ER6CmGbrA1jCbhZkgsvE1Ol/9/FIMUSGvyhmH18CyzCQh4ECHFmqLLkNfdjIejNOcG8ee1IFsF98qjZ69VkInkSBfoNByf4KZFeQGraVa7HZZnWcQz1Q5U3XfIT6YjP/k7g+6wsBAIWVCy3yu3auZjJJJmkuryKEcrC4VTU/zNtYdeVUccKfgU+ZBBhDeoQyzbiCfu0NoBhE/+IOUgxdiGpa1wE+nUiKQr4TpfvRTbA6uC4K3wyoV4atQ6km4tOrZvVzv/HvJNh9kr3F1EYxxNjuseuQh3VhSPAKF+/amwHCeqoMBqAR6fsgFM/jjJsfgdWbux5gwscj9G99GTgPOeXs9BimjOorkvaLF8OJQjVdfm61dbL1DB+0M5y9ReK3drqHHDzphyDNgyZGJS4Z2kEbBubkOYRABMzG23lCZR7wxEQfPcv/BKWQH4qsmivsHbgEALx4e+qr0dwFuNUpuBMPGIVuBJghiBJ5So5jlxPkOEn6jiKPS5c8tv4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8099.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NlP2/ivdJxk6LoLnRyZSy3q76K2+pqspDLzgtHH6FnifHHF0of3eaMpOpXeu?=
 =?us-ascii?Q?p0X1ct/erhRYe2Q6XbVEey+6csVBVvDdY08KJZzFS5ngPqvzchKXrvQKHthV?=
 =?us-ascii?Q?XLeVaoeC/wbe+8BNL+lta4euAvfE36FOOC1g6Ag5m0O1NvWDk3foQCWiClyd?=
 =?us-ascii?Q?P3VMdMvkSXeH+VOO0yFSa4bULapNx6/A44Khxvf9nf+BiGWvHtCWuWC9ctnE?=
 =?us-ascii?Q?G1FRYcjoHVf6KFWX9wwZ0QqVhMQj80+0+0ftDEiw0pNIFZR4EKHUdV7l4SeH?=
 =?us-ascii?Q?bEOhr32/jQo7qU/cWUTDEQ7lXNt8ZGVBduosNQpsjHdMzjI1phVXZAVDtwBF?=
 =?us-ascii?Q?UnuFh6EeZudXPtr/Y/UjLJJgF4jY9so8fHXoo7id2uY6h8+twI5LVdt//T9r?=
 =?us-ascii?Q?mGy+L8peC1WUjRPohXx/327yHV6QiGXMWGqGPG+d76OO5pbgxCNYLhT8zuIn?=
 =?us-ascii?Q?eUbwnleZIaGHeTrbavK3yBrNIWRRMFsIchmuSdgZVliNRW7ne7VPmCAfMg6+?=
 =?us-ascii?Q?wETUDodrezyVGnG+7mZRXIX9QZCV3mSOY7bJhonC9f/SUpAyaiLi9ndFvxcm?=
 =?us-ascii?Q?PIAASBvZh1ORzhAten04mz5NyJ+hvw0CGkGUeSwNe8UgPLk4WwsbJHukTFgb?=
 =?us-ascii?Q?UkNI/MuSAo0HSroFEHMLFKJCeY/WYM5ju2r+LnC0LIc8VBz+vV21cxv7K81n?=
 =?us-ascii?Q?5J4L3am021A8BEg2ng7GmoemB1RKhhlVkpjh/gZgUltX0yjEL7xW6QsAgWSq?=
 =?us-ascii?Q?WzYr4Qk58fhm/Gx94t7QVL19gj82r2nz4t8bSKseS7qoxA5hZzt+5rIG7dwF?=
 =?us-ascii?Q?YsWMNFZF3qfTTv64f1PSEHOTiVxcVU7cgV92mEmtLpvIrWUA5jYVP92Np6zl?=
 =?us-ascii?Q?zPOm6gC8Z5cktZCc5gG3AH37OjTdVie9ylz2i2yL5zmRcUNKGXn3JYKNfUAV?=
 =?us-ascii?Q?5KIyDbDGfprkdDZhDTDeNx4SbQPnTJY8zKtxOThv398LxBx5eGHQaspHCREd?=
 =?us-ascii?Q?RZeAD7N/WWnv3VvCUPgiTLXii2r1HFSrQ0zqLJKXGFSfKT+fZDMxh3lnxZ+C?=
 =?us-ascii?Q?iMdvJTlEMWVtbrVxDfgJX7Q2sks68FQejJeDNZQQVEpQSRSyOwNnWyD0+vaV?=
 =?us-ascii?Q?/Ugjv9ZffNay5TbO5+7VlCYw0dFv1FuKZ5PVqVnJe0yYe8eipJNgL266/fjx?=
 =?us-ascii?Q?9GjCV3JKOYeSA+32pZqRMcWk6SzAFMT1dOOaMVf0dU+0Py/RTpI/z13nQ4ww?=
 =?us-ascii?Q?0hTaK0yoM/Ui9WhTS9wobiY48pv0ihFnyn+hnGEBO/PkWttGsIjWfbIF1utU?=
 =?us-ascii?Q?IhwSYgSdKEx55jnMRI7s5K9KumNs5ehVsx03odi5yTFGfYdKvr/yIrvD6S3e?=
 =?us-ascii?Q?+gJaN7ArxJh8Ppiy22xL7f984OpcN90NMyRD7C8t2s1pJiW1DaqV0ouk8nsn?=
 =?us-ascii?Q?7EjHX0pUgMhl0yox+3En6JoRaJ+R+fRIQjmwlua4WuAT00uo6t4OPmWjRU7B?=
 =?us-ascii?Q?R71CVgqIS3ELLjn88xq96MzeGkw1ON6JBv3qnXBKuGk7siMHh1njE23DcIqg?=
 =?us-ascii?Q?i3tXm94m3FHHlS8DxGo2t3vaPeSVYIjkYkL9393V?=
Content-Type: multipart/alternative;
	boundary="_000_JH0PR03MB80990893203BE2EF0445E66BCF2A2JH0PR03MB8099apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8099.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62021057-e217-4da9-28ba-08dc43101c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 03:46:05.6408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUzSU1VDRjh0Nvr2V3A0kmng2FBn1fSRGCmCC7prwoJS6QBGK7SwQu6qD0zbU8wKPeBWh1oTNBlU7yPd4vvEVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8058
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <elNpqQWx-EG.A.O8.wdV8lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2780
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/JH0PR03MB80990893203BE2EF0445E66BCF2A2@JH0PR03MB8099.apcprd03.prod.outlook.com
Resent-Date: Wed, 13 Mar 2024 07:36:16 +0000 (UTC)

--_000_JH0PR03MB80990893203BE2EF0445E66BCF2A2JH0PR03MB8099apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
We meet a problem when changing block size from 512 to 1024, and we've subm=
itted issue here.
https://github.com/NetworkBlockDevice/nbd/issues/157

>From the dmesg log, we could found that nbd-client be executed with block s=
ize 1024. However, we got below error nbd0: truncated and the image seems t=
o be corrupted then mounted iso image: ubuntu-18.04.5-desktop-amd64.iso ins=
tallation fail. But, if using default block size 512, we can complete insta=
llation.

[2024-03-08 11:28:51.819] nbd-client -u /var/run/nbd.558.sock -n -L -t 30 -=
b 1024 /dev/nbd0
[2024-03-08 11:28:51.819] nbd0: detected capacity change from 0 to 4284224
[2024-03-08 11:28:51.819] nbd0: p1 p2
[2024-03-08 11:28:51.819] nbd0: p1 size 8568448 extends beyond EOD, truncat=
ed

Is this the limitation to set block size other than 512?
We try to find some on internet and seems ndb change block size to 512 in t=
his commit: https://github.com/NetworkBlockDevice/nbd/commit/128fd556286ff5=
d53c5f2b16c4ae5746b5268a64

Here is another issue report in Benji. "NBD export fails to mount with defa=
ult blocksize" that have same error message "truncated".
Related issue refer it: https://github.com/elemental-lf/benji/issues/12

Could someone can help to clarify whether this is limitation for nbd-client=
 change to use other than 512? Thanks.

Sincerely,
Tim
________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_JH0PR03MB80990893203BE2EF0445E66BCF2A2JH0PR03MB8099apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-ligatures:none;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We meet a problem when changing=
 block size from 512 to 1024, and we&#8217;ve submitted issue here.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/N=
etworkBlockDevice/nbd/issues/157">https://github.com/NetworkBlockDevice/nbd=
/issues/157</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">From the dmesg log, we could fo=
und that nbd-client be executed with block size 1024. However, we got below=
 error nbd0: truncated and the image seems to be corrupted then mounted iso=
 image: ubuntu-18.04.5-desktop-amd64.iso
 installation fail. But, if using default block size 512, we can complete i=
nstallation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[2024-03-08 11:28:51.819] nbd-c=
lient -u /var/run/nbd.558.sock -n -L -t 30 -b 1024 /dev/nbd0<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[2024-03-08 11:28:51.819] nbd0:=
 detected capacity change from 0 to 4284224<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[2024-03-08 11:28:51.819] nbd0:=
 p1 p2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[2024-03-08 11:28:51.819] nbd0:=
 p1 size 8568448 extends beyond EOD, truncated<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is this the limitation to set b=
lock size other than 512?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We try to find some on internet=
 and seems ndb change block size to 512 in this commit:
<a href=3D"https://github.com/NetworkBlockDevice/nbd/commit/128fd556286ff5d=
53c5f2b16c4ae5746b5268a64">
https://github.com/NetworkBlockDevice/nbd/commit/128fd556286ff5d53c5f2b16c4=
ae5746b5268a64</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here is another issue report in=
 Benji. &quot;NBD export fails to mount with default blocksize&quot; that h=
ave same error message &quot;truncated&quot;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Related issue refer it: <a href=
=3D"https://github.com/elemental-lf/benji/issues/12">
https://github.com/elemental-lf/benji/issues/12</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could someone can help to clari=
fy whether this is limitation for nbd-client change to use other than 512? =
Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tim<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_JH0PR03MB80990893203BE2EF0445E66BCF2A2JH0PR03MB8099apcp_--

