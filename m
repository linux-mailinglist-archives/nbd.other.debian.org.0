Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FEDAECE59
	for <lists+nbd@lfdr.de>; Sun, 29 Jun 2025 17:39:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 31B8320631; Sun, 29 Jun 2025 15:39:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jun 29 15:39:10 2025
Old-Return-Path: <il8363836001@msn.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,MISSING_HEADERS autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B156E20622
	for <lists-other-nbd@bendel.debian.org>; Sun, 29 Jun 2025 15:23:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.072 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
	FREEMAIL_FROM=0.001, HTML_MESSAGE=2, MISSING_HEADERS=1.021]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Rmu8cv-b5b6J for <lists-other-nbd@bendel.debian.org>;
	Sun, 29 Jun 2025 15:22:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .msn. - helo: .nam12-dm6-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 923 seconds by postgrey-1.36 at bendel; Sun, 29 Jun 2025 15:22:58 UTC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2082c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2c17::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 96A6820601
	for <nbd@other.debian.org>; Sun, 29 Jun 2025 15:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdo/eeEs07sy4nTAgXqjOqBaLq/ki8pujeM6UgsktggQJo7ZFjuUQ9pZ/5TZniyuX9Wl4uak9ViuwkTys+hKTnk4KpszVz3bp97jc5TAN5QwbP2uQvsMQmY09ogp/7YgHylOaNB9WfpPc9ASf5MlXUegP0Hu1/punjdeNPe03vvJ/7WpHE+ZNO85BA83f25lJXmfLAwNLixzhAtLnZmTMwgpy6CVKHCvRkW8UDL4l7icEfY7AQwjpPHYQGMP91ClH2V2ydWU0GTrJkAFqQHIpFFxfTk0MwobkGZYOgsxOZgPm3Ct9voG6WVKy/YpLF03NRqjfcQrMdoXnby1M3xxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92625S9o+k6a04fn3FZs/KRTBspWtRRxwi/Jf12JHaY=;
 b=Vkmja+1Lpmn0m/st+AObJs/KgYlsQ0Cpli9TZ4IlcFwTE27hGLqjrd1DMTeuuddk+ilnip6pRPbNsZLawT/WTOUZMb/TNhSUEOFtDFiAWygE1hH9DM88+IK3LVjPYrcVxA5ZhIir/00W0OVB2WqQemqJXoVUprkEHZiRDwnK+sCPTVb90IVeawlW2gPQBUWYIWOjQQQuaLQMsaWN+x79bRGOz1rCp9TMIwatPSBBL06FDRYv6Cy8yYn7dF1Dv//XxQjES8h56sGbAlocBZF50vc7lpqz5O/dwYjFaXBV93e5QF/AMKSsuhNBbzVkRr3E4mCKotzcifkYXfAixBpmXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msn.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92625S9o+k6a04fn3FZs/KRTBspWtRRxwi/Jf12JHaY=;
 b=o7Zhfq42O3b7fNCKDz2wmoWyGcs8RacUll7hfCZk1ggTrwL7iz8+S+kR5bANvJXThj9d33Un75cXz6QfsMX+3XiWuqPuSLM+PFjmc5FnEohkOQcBO7smhrLP1m21pNtqKRiTe3wzoq0s+OR7o2gnFW54ZE9NXnnXdQQCvpM6msPV54xw/Oq7GzVxyWqQa6Akf5rII3DDiNNSIhChh2TTyn3h4tsHyhQbOvDZVHnz4eEiWFeRhChkUXjxHpR8RnDCSzJeM4QAhzQdfCkjIrmqhe948UMykqt6J4wYUYUW9ojOBQ69zb9hQ23wdGWX5Q/zJrmDaEVIiHSDz/F+i5TsBQ==
Received: from CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1c5::13)
 by DS2PR84MB4023.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Sun, 29 Jun
 2025 15:07:29 +0000
Received: from CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::b633:8ed7:f5ca:e7e7]) by CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::b633:8ed7:f5ca:e7e7%6]) with mapi id 15.20.8880.026; Sun, 29 Jun 2025
 15:07:29 +0000
From: Engineer Richard ANSAH <il8363836001@msn.com>
Subject: Fw: Re : From my office
Thread-Topic: Re : From my office
Thread-Index: AQHb6QcktyNQh3DHfUuA3fw62gJIo7QaPJD2
Date: Sun, 29 Jun 2025 15:07:28 +0000
Message-ID:
 <CH3PR84MB3670AFA142DE4F54BAA5DDC7C247A@CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM>
References:
 <CH3PR84MB36701CC5B8257DB16F54AE29C247A@CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To:
 <CH3PR84MB36701CC5B8257DB16F54AE29C247A@CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3670:EE_|DS2PR84MB4023:EE_
x-ms-office365-filtering-correlation-id: c2c3c2c4-e1bf-410b-0343-08ddb71ea9fb
x-ms-exchange-slblob-mailprops:
 quCBMN2EvO+vsBlME/DvwCjKTu32n9XwHPlgNlG1R6MN1Amr/cw/DFP1Sl7zgUWeCEiVTOGBdiec6o2M2S0L0on+44GiFQCPwO4bmUqmmcHUs8Oy0zYbUYCDmBBNGpciXQO1T/IGjwkpvhn3S0pwCxBVNWJJA9O7BjmCqy3plwa5cwne5M6hpHRHBtqjAMrjbClvwXRm0Ra79/y+FbSjEdaEsGwNLkNCQYmvPa1ryL3o+iKv+UlA035QfRqvfxkpAvBMWUAw90LTN18I9Xf1Aa7j1yferN2vhCTYQDK6B25Et9MHNpXM0/X79LhVLm7mMrOegu0T5dBSUmkAvDxBvftmW7+wQ57VEvqqydBjNqizD/cpTz1l0WRLfIVLgtTklGxziOrpg00FxC9BJ6N3bat7zNVedtxFNW5CkuPZqPxXmRPvsHVEqoKfUzxfHx0kxa/Gv3i/xLEr5WuCQT9MYEDcb4expowZqXWLN12+Hd5ILIsLWEDImm3XfAIJSaGFMkzCqtWZ7/QNIwM+Euer7e2yNBgGZF9X7bX6ILZnE1hH2yxo4yXYTxlRSRawDVWFMWXSUMHvC87ihnXj6n64Ah2+lgSScEg3mJFBnv1J2gwffslffIjiSUfCcdTXmykORcgOlBK+waVIIIJkiIUcNBeMMN8VSB2JHLdsgVXTEyiiqLH+7tPT7ZOFqH+EhxnW30szCuLX8fMlFnTbmDL/9A==
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599006|8060799009|8062599006|12121999007|15080799009|19110799006|461199028|7071999006|15030799003|102099032|440099028|3412199025|39105399003|39145399003|40105399003|41105399003|51005399003|26104999006;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?t3kzs9SeQCzfj2Yfnjc0BbXpnzjy8ZI+Lp2YSQkZNFDIQNWCwlX99NP3Jj?=
 =?iso-8859-1?Q?qWv63pg30zDnH9UqzixMoEsFnYPh1tgvCfxBrkn+WQfNR5dAyExl4e8kh8?=
 =?iso-8859-1?Q?10D7oH4wLn03v/22OVlKeu9bu7CSJ/4VK552klHw5VCcgmIWAOMCNyImT4?=
 =?iso-8859-1?Q?da4NuzQr+EGwli5k5qD4nB04RaHZuiq2P7DmOGPlHsaLscR/P9cdT6xVkJ?=
 =?iso-8859-1?Q?VphbFzFN/hD3wqi0EP+FIqphk71PFqGBGt8J5K34KYRZbQwkDj32fnNgH6?=
 =?iso-8859-1?Q?cVkVU71dp4ypbPu3uuPb00sYD2G9EL42YRkClIRTgTO1fM3QF5FD55TIbN?=
 =?iso-8859-1?Q?cWayBYxde+vF/uidbO7oxRVueo82fzTz2bFXcbUByTemS5ygUIuPm1s1Wp?=
 =?iso-8859-1?Q?ESRAQK9PNFfwq3SYglEACR6wZ6Jeg3h+5D7/mEvVLlD6pKRkqjLMTLCbSB?=
 =?iso-8859-1?Q?gI4sBL1WY+aEQdazhceCO5RUOTq9CUmFnzwO3tpIAVAJZPuhRuLru+XkI8?=
 =?iso-8859-1?Q?u4ahhCBQjMyPQ29jdtlIuvbJAGFjT4V4FIB+Zytjm8YiG1IlGT4rbERtds?=
 =?iso-8859-1?Q?fBqh6/kDNxXrzLE58pGKxqhdaoumKTHyP2pTZnyCH8TFVSXA7DC0r6u0mx?=
 =?iso-8859-1?Q?kX0OMXa8ttfuL5oEa7cvf86x5AEjFfa23Y/BmN6OG2V+1dGeSQxAg6k3MR?=
 =?iso-8859-1?Q?lK1kNPQSPBLPZLW9q7bxqON0SGlD/PXBGtdbjZGyn25XDN/xxBSCtOkgCW?=
 =?iso-8859-1?Q?M+iCg5O/LI83W0IFviephiqhJRbdUq+enFQC+1o0jSCF2tm9rmoPpMg2/a?=
 =?iso-8859-1?Q?o25h6/LxNWN53HhTj4elD5asIFjLuS9pIcyQJM3+TedzXzvuqVC6Nfx/9f?=
 =?iso-8859-1?Q?vEc8pv9B3mWNXCC6Py1z6sM0SCxBoiWWeCubrI+aWsXa2HwOcEsBxPy5mG?=
 =?iso-8859-1?Q?r38oxhbm6CCWwB1TfoXHsmwDLShKR2WwrKXKnCkXQwmJN44I3YBikS8kX5?=
 =?iso-8859-1?Q?K74FjjHJHVLWfShlV/xmw6PkWUldPnRjSGU74h0Wbij9romb7/eA/dbiGM?=
 =?iso-8859-1?Q?1eoEyK7HQRqo0gNsu9u3Qy77peUHDMoeTbuP85NLhirv6kd4vTpob9mqZ+?=
 =?iso-8859-1?Q?1ArQgJDvqa1d5vobHd9PBsALdfcRyoyAAK9lvOgEtTsDXgWrC0Q2S3xrz7?=
 =?iso-8859-1?Q?CsXW1lGi7UNwWQsIAIvzAiA6+fpXWtVhTqlvFSnjgTxu1XAPDylLFh67zK?=
 =?iso-8859-1?Q?TGHisitiGHDbkn5SNYsnHINLLOFaGERktvE7aua2Rqjql4tF4pP7jwdSzI?=
 =?iso-8859-1?Q?VwA3QwJf8g4efAggkLrYckvLQ/9sVWbJmyH3HqDJeFZXaAwXFPxFSrztXM?=
 =?iso-8859-1?Q?VGvFZEK/trSZ422HcpGF8zoAn4uKE2lg3AMmCg58Drj8lw/0zyam+R3BRn?=
 =?iso-8859-1?Q?WmC3T/3tk7zxQA50+z1h/H48PrdheCAka69rWA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5L4r9KmA/iC2m8m0q6jKQ3Lg7FCo4en4ZNhgPuYBHD/dYjizegI6WMaci6?=
 =?iso-8859-1?Q?eD7LDH5uZm7o7+AXt6SjLCYolQS6ReAdlcr1hxvDCnA1CE4XGDPUsYtscP?=
 =?iso-8859-1?Q?CxawlrXAYq6Nv903XqDS4pUoHzh6yc590BXkxuxeh4D3dW6odRJp9ALTxF?=
 =?iso-8859-1?Q?Q1DqVIo5lo2mQyJSX8uLISl4OKldmw9xjo50JWv6MBB+e00qX8gWGjB9vM?=
 =?iso-8859-1?Q?iGxj0eXNBQLeIcZPwykwtcVLKCxPovG97TRScgiQIcdns7RKxaQ5fIPN14?=
 =?iso-8859-1?Q?5JZaGiCJAuXQoWgXpGLVW+MqLJAzNB2noqMbKtkd5+GoyMJObdkO3YvxRl?=
 =?iso-8859-1?Q?COi8obwKEqXfmV1FDGk5jwx/gKtfFWiCoH8jyWowZ+eIAI2tADCmY/RcV9?=
 =?iso-8859-1?Q?0F791D9KAQmeyNU5s9g2P2qDkEf/0fqmsdRcgI+qfZ9LY4AiQt2wsl6xYa?=
 =?iso-8859-1?Q?rp+Yz0/Zk5kXE/zSvGY+0vP9u5ugQdjhEekJ8mhtGnnk3sVoW7gyZedlPQ?=
 =?iso-8859-1?Q?zRK2W9Ka0XDHs8+U0+SvNaPhN689/oc7gvL21VmCONWn8jNuzefvdwX4CY?=
 =?iso-8859-1?Q?5yYI53l4Bz2CqNufynY/8T3LZ/qTWF5fjwL8O3dLMPqfSb2YjP7vLr/z66?=
 =?iso-8859-1?Q?BCNcOgYANM9sMiuJKcqUORCPEroobg+3mCfj+qVOWmWKX+sgAhJ1BGYWk+?=
 =?iso-8859-1?Q?0gVKdbx+chZ1M8TS7Zt1S+W/gMRD3r8/COPCEWinjnIruVoX8vgE7rt5bA?=
 =?iso-8859-1?Q?nvwY2OcqYp+oSPquSTy0LjX9D1tSNl0UnuIXKB+viIt6yYl9GHEoqqjY21?=
 =?iso-8859-1?Q?NFaJVwaLMluCw0q4Yi9gu+5t4GSZspvw8JkembbbDTOYi6TLS8WfWeWsKi?=
 =?iso-8859-1?Q?STCS8GxQNoYewpEZSn7ZXsq0LSw3MnjMXQqthXlbRBXpuISpTE6NDHdylM?=
 =?iso-8859-1?Q?kgqW4HskJNSL4puoALYm1P5wNpvan+X3DOxyENagTvGXL9mImXa+aaAzzg?=
 =?iso-8859-1?Q?lRX8114pX1fA41wcHNgu3tNEzrJwUhq3DC8aZw9ymHSBxfbdeSHS7eR3Q8?=
 =?iso-8859-1?Q?dPrrg2ol/BnHfboXVpOmoXuiXsV5zlNHIJZd8gN8pge4aox8/wB661kIN6?=
 =?iso-8859-1?Q?4ywtFvIZrGKxEHD8HXkl+J3LueI5lJqPPMINk9N3/j+cFpASckZ70ttyGZ?=
 =?iso-8859-1?Q?3iHZlb7hn01E2BGPjfIRozhNht8Pk1+6A4J/hJgnxPYCAnpT9jCJs/+Rny?=
 =?iso-8859-1?Q?xTITAA3d77+Z2EJPOvdQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CH3PR84MB3670AFA142DE4F54BAA5DDC7C247ACH3PR84MB3670NAMP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-774d9.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c3c2c4-e1bf-410b-0343-08ddb71ea9fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2025 15:07:28.4768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR84MB4023
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4DK93zZ-UAE.A.BhnG.e4VYoB@bendel>
To: nbd@other.debian.org
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3397
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CH3PR84MB3670AFA142DE4F54BAA5DDC7C247A@CH3PR84MB3670.NAMPRD84.PROD.OUTLOOK.COM
Resent-Date: Sun, 29 Jun 2025 15:39:11 +0000 (UTC)

--_000_CH3PR84MB3670AFA142DE4F54BAA5DDC7C247ACH3PR84MB3670NAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Greetings,

This is the Chair of the Procurement Committee. I apologize for the inconve=
nience this may cause. After completing a major project in my office, I sti=
ll have an outstanding balance from the project I carried out. I would like=
 to invest the surplus in a partnership with you in your country. I will sh=
are all the facts with you as soon as I hear from you.

Mr. Richard.

--_000_CH3PR84MB3670AFA142DE4F54BAA5DDC7C247ACH3PR84MB3670NAMP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Greetings,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This is the Chair of the Procurement Committee. I apologize for the inconve=
nience this may cause. After completing a major project in my office, I sti=
ll have an outstanding balance from the project I carried out. I would like=
 to invest the surplus in a partnership
 with you in your country. I will share all the facts with you as soon as I=
 hear from you.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Mr. Richard.</div>
<div id=3D"appendonsend"></div>
<div id=3D"divRplyFwdMsg"></div>
</body>
</html>

--_000_CH3PR84MB3670AFA142DE4F54BAA5DDC7C247ACH3PR84MB3670NAMP_--

