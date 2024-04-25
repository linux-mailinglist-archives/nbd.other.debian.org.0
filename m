Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1F8B20C5
	for <lists+nbd@lfdr.de>; Thu, 25 Apr 2024 13:54:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C860620551; Thu, 25 Apr 2024 11:54:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 25 11:54:15 2024
Old-Return-Path: <prvs=838664f06=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 75BBB2058B
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Apr 2024 11:38:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id va_eej2j49nJ for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Apr 2024 11:38:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 439 seconds by postgrey-1.36 at bendel; Thu, 25 Apr 2024 11:38:48 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 68A3820523
	for <nbd@other.debian.org>; Thu, 25 Apr 2024 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1714045128; x=1745581128;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YLowGjtt9aBHFXVypEHe6yB453BEBxd9kXrLCBPADKI=;
  b=qtICb0gm9PStwRawgIEwXrcLjxy2AXI6bfqfxXjSDBZTwdOApI9j2d/R
   meGULEyZ40KuqZ3EUZQXO3KgnN7kNnhY+q53yjrQZgZsAMyhxuHSk1ByA
   D3FLGqzEvj61bWiqZdj4r7zBxxqPEx2++gnrI3v83Ocm+xMysddQ69w0i
   o8SZ4n4VHZAzEsvI9N+z8Lp66XuF1NNByP6Uz6M2Tmwoayj4S6bZcXqiI
   GJsYDpJ4rDrh3+U4aeWrOn0yJ7KSLvRnbhVVfgFYHBNDZqrQcsMv8Vs4v
   d2NZJ+VSN1aEKBI3OjcqY71NyPwMJt7WMSdd1GpU/clX9dWH5iiUfyX+E
   w==;
X-CSE-ConnectionGUID: J7nnXNcrSsSB+N3HcfslyA==
X-CSE-MsgGUID: xFNYsexbTe2QRk6C/xEuIw==
X-IronPort-AV: E=Sophos;i="6.07,229,1708358400"; 
   d="scan'208";a="14838696"
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2024 19:31:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcYvd7M+c7rgcFpPjr2ZOOtBAwkNl/0WT1ddqP85l5UcbkF3Il9X0kWtBjUHQNQ+/EeTC4zDZDaKXpNaU+QiqCv4+uzdKsfmbUzSuXfpqNFlF7p1TJLBe1MxY1LV5TbUXEj7BBQTtRxRIx7NU7dDiqOP0B3PtbdI8Uytk0NFZN2ZjuxmbeYK+axAwK07dUwDSFTN/p3Av2e2vk0Cf6Z9L/1JDmc6N/sRy9aPgppba47R1RXUYQUGDrG5c4z2siArZBHTypn5Mw+JenzIpT72w7ZoGFzIvx/XfspiF9jHhK0bBBGg1D7BjGXqEtgdoi/A52ft6rNzheVryzt0bGE34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLowGjtt9aBHFXVypEHe6yB453BEBxd9kXrLCBPADKI=;
 b=JB7VfHiMUHJB10Bliv4uxQfPdxj+nvEK72d/Sg6dIZdlfwt/ZLCVeDHWS9ffhnpj3BAGrOw0ffnIQVDkZy8AFjOLZ2KF+zTjKuyvuXZDnmg40Six3Mgs880BXDAob7gzWwSVdPE9rl1Dz4lK6Rgnjls14UUxZGxXsYaC0ozEREb/D2KE/U/TO01rAH2mXfMXChFLxDlOXTfs3dCeRmFiD8csuNZmrob6wQ8Ip7EbJFf19nOxG28WRY7NrnFr4IBDSIPHJvdKPYEaDxEFJZw8+bjmaBe7i7JyO+ljkaolOLfIkjsYS5H9UUpRdnrZCUWwdFiiiwZMqIgZzLlNuppjmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLowGjtt9aBHFXVypEHe6yB453BEBxd9kXrLCBPADKI=;
 b=lwxt/Oc6QWyox5fXIJK6tAzfFyzjYd+1FlqD3thc9aqpJKeNFGiOrSXafP6w72iX0rNtl2A9VjIlRPMut8oaJ9ks3y31+D6pOfks9Zsu4bFHDNc+290BCVZQn6+y9Ixl0cV5KoJEVcAozW037WRH4OOrbF1amKMBql0+C/h15K8=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 BY5PR04MB7090.namprd04.prod.outlook.com (2603:10b6:a03:223::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.46; Thu, 25 Apr
 2024 11:31:23 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c75d:c682:da15:14f]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c75d:c682:da15:14f%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 11:31:23 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Yi Zhang <yi.zhang@redhat.com>
CC: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>, Josef Bacik
	<josef@toxicpanda.com>
Subject: Re: [PATCH blktests v2 0/2] fix nbd/002
Thread-Topic: [PATCH blktests v2 0/2] fix nbd/002
Thread-Index: AQHakLPoQjy1N5XE4061LgLdbSAXmrFyraWAgAY5JQA=
Date: Thu, 25 Apr 2024 11:31:23 +0000
Message-ID: <jar6qqlpt3nzva6gfwtrvpmtuujsxhoorowvr2obveczcyno6l@yyjz66stfeko>
References: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
 <CAHj4cs9W1Ad7Q8axcbDd4tsuPPz3MBxGGqCNPT6efbkgCnGMwA@mail.gmail.com>
In-Reply-To:
 <CAHj4cs9W1Ad7Q8axcbDd4tsuPPz3MBxGGqCNPT6efbkgCnGMwA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|BY5PR04MB7090:EE_
x-ms-office365-filtering-correlation-id: aee153b3-d7d3-427f-fa88-08dc651b3cb2
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6wD+I83gM1aDTNrG4J01SiC6R9CDgtslE0W7V8N+41XT1QhJk4YXkyH9NmxC?=
 =?us-ascii?Q?0laXTp9ZkFvEAYCdjMpTJnruynfQ0cNOYU7cvPtI7tzSBgC6AQQog9vkv76S?=
 =?us-ascii?Q?U8h0DjbeKCElLKHysfZf3/uBiwYph+d3SO6fDRaED9t8FHBQT81V9jyLLczi?=
 =?us-ascii?Q?yJi5HshKmcJNsMm8E+lxVfrqU2RD/RKQ1BPF56/+RGafkT7Fyl8g1e4lOjIq?=
 =?us-ascii?Q?EheVFLGPZ+BMxFTBZi+aq/gpFlHV1ozlnNG1K7DHO9I7AT8VnNV5a/KZNi+M?=
 =?us-ascii?Q?s+l/rF40vuS7Ls2jZHVXwKy5vNinoD96aq/uZqdE/UI/p9SGxvJQP6gl2pGf?=
 =?us-ascii?Q?8H7PyJ0dQvgPf3BHq3XloIYEiW4rUY0eQYnv/zT0InnDFxfD2hKiHoO9HpU2?=
 =?us-ascii?Q?RcQdaCFr3VoGuL8cY4fzRBS5/rLO1KxtPAQHttKv1DLe5LFNJmPxLt0LNt7h?=
 =?us-ascii?Q?2HHh5NLP1LVZSmusU83mYmi7+S+Bb/RkRMWSVc5KTZ2hbqhq28/ZeoNHksJs?=
 =?us-ascii?Q?zvYQrESRZ3chYD+o0BFjKXOMcQoMQm8yZ8Rx7QK62ljU6e18k8K1T0YFUjjR?=
 =?us-ascii?Q?W8ffSLJvKuopJYKbSvV0AZN1YsFXphJf+XOjtNkqmjGZJizU1KjlmLsgKJWW?=
 =?us-ascii?Q?Cf6Cqsb6wO4CKHTGylXIHy3ZB+tJOd8h4bpPoLt9URa4iPJLWIfl6khE500r?=
 =?us-ascii?Q?Ui3xPJ2Qw4/PWteCvll6yGCWPBLHP1NGkAf7j7h4A9pRdF4cKqHtnwb5/ImU?=
 =?us-ascii?Q?G9lh3UXd7f6l5E3/bDCxd0C5/WGH2ODHjqOwLuE2+BnkBJlyv6wVAEabpKrp?=
 =?us-ascii?Q?RnTQS5oIgVoSIfc3aBDgaB3j/ANSuZbMK5bGT/nczX8/zAyAjPjsQwoZi3+j?=
 =?us-ascii?Q?dCZgpnKifYwgFj1ybw2Po9xWdo7OivXwK0PkinM5ZmEB5LxmgU1/ZKZel5Rm?=
 =?us-ascii?Q?+Bsmeo9sOSCSGd0O4AVpP9HQiHmSrFGDaxrBAJFnoXZBIeS4aIFwFM6TbJlt?=
 =?us-ascii?Q?mHGRVjqHJdeh/9xx+nyzsGH1oVwnnfHZC81haqW2dn2wq4GpY3eMuZI/OtPF?=
 =?us-ascii?Q?0W7QXAS1AN+btKt1PIYeMhGYhEb8B2mwaSuQlCYyeIGZ3sBWo1kQ5zjsxvYI?=
 =?us-ascii?Q?xOvCLPYvY7BF99hd3bTRTy2DhoLEU9piC8QczhgpOLUg3n2gKQ490/bULjfa?=
 =?us-ascii?Q?vcXcr53ETq5UgmZIkgWp2NDqww4C3hN436cbywAuC0p95GZoz/xWuH12GRm7?=
 =?us-ascii?Q?WctPszLId0By6ApTOFQW+SM+BwCR++HUpRsv+9J6x1Zjm6vB0wyJaRf2AkXQ?=
 =?us-ascii?Q?xecI+SRxZQZO15yJPGbHlCY2iCDrn6WOLYwmvX7yX1/tbQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?q36sjdIk8I2FGUy8iG1M77UwH5w2j5BIJxrR/LcN3sWH0xJPR3FtuzEH4Ojf?=
 =?us-ascii?Q?lQ38Zdo59pKLp36NpL4/1j+CNOgjkL+c8aC494osjEBrBRqFuUZGpjDKdnbq?=
 =?us-ascii?Q?S2D/TPcqLMU0bhzQ+DlIW6EJc/sOjIrOI0+5CR8HegmNYRTP38kt2+ehfD87?=
 =?us-ascii?Q?95qJ8OLsPMpcL65THmqBAM32nCEYER7aJnYhaAPVuSlmZ5GnBDoksswTLEc5?=
 =?us-ascii?Q?Qu3I+ru0+B4sYefYiNrkTL6W1xuWiqVFkUwkVITMY41Mx5Fe1i9EJ2kqp+8w?=
 =?us-ascii?Q?ziys2RRvejSUfyxNIydykoIxNTNZNYzVmrTbSopB8Vx6K1H0F1g4qx+Z/ZLN?=
 =?us-ascii?Q?CyG5BQ8F8qUpyYN/HdtukgZJoqYPqm4HnOpoepgHK//YI3G+LEX17mRkUqFX?=
 =?us-ascii?Q?MuhbyJwU1G8N0g42OXVkp2CdmJVkDiEXy5LDv8SdRarfrCzg/WB/+vNjD5Nh?=
 =?us-ascii?Q?IlveG6/HtooxHWodYe/1+uHepP4To7zvUFtgjgpX55lOBFn1WujJygzWe4Ko?=
 =?us-ascii?Q?pFpC4YZYx1D4ARBf7702laS8VqryfMVuetm4VB/dbfOOrpK7MNBWn4+EFzQX?=
 =?us-ascii?Q?5UPviSKLFo72UkmxNbhmahIBPHiFWXLF0axb3cxUBFQLt8FWnoXIZv0CGLVD?=
 =?us-ascii?Q?nFFN8CrKQrqlz6uk+hSrfjTCioygY1q2wNGChbTww+XZ/j9vJ/OK8lctU4Fd?=
 =?us-ascii?Q?tH/of49HNjfCvjpJXYMZrNQqV978PrnSqVWqcmAOX1fpnG16/SLQIMZfIyFS?=
 =?us-ascii?Q?oucNp4sM6BHovkZSVNPu+OZN3mUYBxVfivOYLNai3eM5U4SaOd2D6CqABLzy?=
 =?us-ascii?Q?yyp/nUsbG95bKWOmhptoNQSyKcOQBibGpK8FCiVFSNGHjqD2qA2jG3kVlYt9?=
 =?us-ascii?Q?+8oFZzNFdHlSYuiGY8BAa++nD9n8mwQ3NmXQWgK2Zf2tXtm2LrseRyLra3zv?=
 =?us-ascii?Q?o1dqWddwuzjDTQFzaMHZ2TO3l3+AqKe+mwjVjEYAfWKm9/RgphEL+wfruSwz?=
 =?us-ascii?Q?8/z0MRvmIh7xqqLy6988x+ZSFob6qdnAcAbfyEt4q7SKILZ3e/xy6szBnva4?=
 =?us-ascii?Q?4HTe/KrYjBdS6xBq1A9DaNaLrVd7D4EH+brV2gqhP5bLqOPcMuJL13HVXBHq?=
 =?us-ascii?Q?fRWkWR6eYb7G+aWHbGHABwAKfhbMjxLcvxP0DjTuNcWk0PHMXhR5v3P0jtUa?=
 =?us-ascii?Q?2cxpqAXBbkIWtjs2y2LmYvbyCC5MsMWhidsb5CYHxb62JsAAD+r6O5kTJKa2?=
 =?us-ascii?Q?t43r2BEdgskjjUbkBcM7LOoCtkMnf9/9BXIeubUGQ6F4tIfnBm5Wi/mQQRN9?=
 =?us-ascii?Q?XRXOlRusTDZ9WaQGYnFENzVI6oq6IwZFmz0A2c0W0hT6R/zehqrAJmHEmyjL?=
 =?us-ascii?Q?lRoLIMGK5ikXzqYOZ4HT/k2EB2pqeT0NQU2+ExM82YfTj+nfSilmo/1qw/fY?=
 =?us-ascii?Q?3fwMUdBVE7BK8gCDQBAxnBRR9YoQgB1zHhxc5ThIQTXsrZE3+uLrSV6ksvwS?=
 =?us-ascii?Q?2uLynz6Md+pfvF/oH9sxk/KEKL2KwAkKNs9s6bqHTQggriZIJyMAseBtKXq3?=
 =?us-ascii?Q?UCLa4g66b3AJGiBzDYgiHkWK0NJz+Kf6YxTQTtDwUgKSSa0hmShkjSFnAy1H?=
 =?us-ascii?Q?X/euQ09RU17A6JHlre6Pd+g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5F3C3E14188F345B23AE6255C41F3D5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cNDN6cUmL6yRl+lp2iau9rb42U8X29blVa+bvj2uZpwWG02+ncKLQBNyfV6mweNCYQlnXmneKB5Ihfnmjmee62ce9WSDhVN5Joie1O6+5EvUobWWXM7wCr/hQb/bC+kLRvARn7A/cy61Ktc3IdTMSEp3zquWRJgNsfJjk5cKx0CbshDkgMPQilpYZEllt/PwZpshsBtZ5mGIYDZ0gLw62XObEYXgCgw7ifFO+zHzE/7hS6UL/tjJj6+XMDPJwCi6pFtg83va5Uw7Lac+6kiBkIHeCcyzA3/H3DsvVFHrWFrUFm4ZYoTQOoSoolgAUe0I9knEzD7WpcgTxBr7hSUVijET5nR1NJrfGBC34eMUndw44YYdsQPjO03BU3urI1eACM4idvAZRg51XJdxnj1rtobTZGo1Kjt4cBoFf9hPm3d+axl/rn/Hyrw/dhcA04CeNMFOJGwdpwZE5/oqjudVvFxYEeWXyVxwrQ/dSUt1DMI45jRgqyvkk0u9DlCn/UBZ+LX3qBAg1Thjtzh/9wj+HqtnU23VpiQr+GPOEz46IoSlpKq3MhUcCHwufYE9lQlBcEOBOBvDK5SYIPVMCMuYx/qC4Hl9RwWh6nYW7QTWGrqv1FI/4ERKuiYn6RVCSYfv
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee153b3-d7d3-427f-fa88-08dc651b3cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 11:31:23.6429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prRDb8aAjWeTyvMrL4oh5bbxBUkJ9eAd6H1Q1ylBfPpjrDnLkiHITmTId7C94IM1m8njt/Zo1hxj381HtuafJ75fPZNljXSN9c4J+LOYngk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7090
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ARiEUl-NBCP.A.kfE.nRkKmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2800
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/jar6qqlpt3nzva6gfwtrvpmtuujsxhoorowvr2obveczcyno6l@yyjz66stfeko
Resent-Date: Thu, 25 Apr 2024 11:54:15 +0000 (UTC)

On Apr 21, 2024 / 20:29, Yi Zhang wrote:
> Cannot reproduce the failure within 10000 cycles test now, thanks.
>=20
> Tested-by: Yi Zhang <yi.zhang@redhat.com>

Thanks for the test. I've applied the patches.=

