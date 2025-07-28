Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76CB135E4
	for <lists+nbd@lfdr.de>; Mon, 28 Jul 2025 09:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3D9AB20721; Mon, 28 Jul 2025 07:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 28 07:54:10 2025
Old-Return-Path: <prvs=297e88d02=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 86F382071D
	for <lists-other-nbd@bendel.debian.org>; Mon, 28 Jul 2025 07:38:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.579 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mANd1mqZTt7Q for <lists-other-nbd@bendel.debian.org>;
	Mon, 28 Jul 2025 07:38:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 434 seconds by postgrey-1.36 at bendel; Mon, 28 Jul 2025 07:38:42 UTC
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2CDE62071C
	for <nbd@other.debian.org>; Mon, 28 Jul 2025 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1753688322; x=1785224322;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=uOIYZkFuXPCBtXOKCgFoODAAPXb//KwWggVIUMmyU+g=;
  b=VwQCjdIgVNya7n7s1AQl8x8edfzS2kP3ZkRIe+s+7aYSdeotQQQH/NT9
   IQ/7PSX4uq8EVKyoa2W3mR99JHZTfNlzjNyaAUUo0wKOBF8DBnYhhYE0I
   To/KAsCcjxEwxMxSWazbV6DfgQDiTwd6HOt/A4zyZH9no6ECe34N1O4PG
   0EyY/7tTz9y/xGYLQ63yeEthyiqCOVjeFdWrUOQEiGOd1pr6qlzh+SOL6
   PM8rd24eU6xrwlW9Cqw+j03ep7+jpWFTflRhuCmjwlfUP+lS3IaZ43ooO
   PXPTCvITrAzTNdsHnXAd5EurkQSX5hA9H62B3A30qFgxhDnPjkEe41JnR
   g==;
X-CSE-ConnectionGUID: 2WDe9AL9R7+vteQFznfZDQ==
X-CSE-MsgGUID: 9WNP/uv9QGupJ8TKBgQaZw==
X-IronPort-AV: E=Sophos;i="6.16,339,1744041600"; 
   d="scan'208";a="100936930"
Received: from mail-dm6nam11on2040.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([40.107.223.40])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2025 15:31:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlW8ROwMPQTycm+cgWPVel4wj1H1aKjrApwBmRpNiSXjfDreygqjkliWf7bAM2z6+0wh+nY/wJ6kNoEj0ntTfYq8GI1Z3JGktJm5XBWTDblLe2gBoEVn+5kQ0StbJQnOEhuYXIClvTpa1+VtEuVLL5OUFtaZQk7zNF/ZaMgVZb/UodgCJ/O+40P4SGIS23yQF25BTZjYXN/AkXDQopPZV+RNFvsaIa05mH8YQfGFRCWOd3vyVaxWDjgu8M5c6FUvKj6Ct5sk3akbag16WGn2pBLLYvf6T7FO5iuhY4MHt71trrmaF/MyFoKqdPEk0Cc2QCofLTnVAwmnFeTn+ph60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOIYZkFuXPCBtXOKCgFoODAAPXb//KwWggVIUMmyU+g=;
 b=d8Pv6CkaOlyR9x9GWJdLat5HPHqaXYSfjNYbfCTxHLPm9m7N8FxM+LkjF2I2ozt9oMIhoOb7Hu97u1qGbp0c/RNZiQjPD41E0DHkjoK2EkTw5/iv6jBe2RgCjOvHHTb+7aqxEXSFdhr2aw4jJ+hTE3A8jg3Qn5mvVCPEOK6JcnL8L9OyzNI/A/knaTJLgHsvT3oPAGlcXgMzzcFqLFgCG5CF1uqHTgEqH+hrvpJ9gzWEpLsk6pukKNKTqr9zCXGowdkT19lIAx4DT7KgrHKarFk9UEM6OAQ0bNvWvqGUNkwKg6rh2G/KCjFFat84gr6sbCRroJgsu8zLyrIsrsUpuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOIYZkFuXPCBtXOKCgFoODAAPXb//KwWggVIUMmyU+g=;
 b=nyov2Bk3ez0Recil4fw2+2M2Hkqp8PxMIJUEEcMSnhdCMTqKagf33GnsXodYcdo3w7AZpJcux2tXPNZU8l2SRUa+hcvn2Q4ql38Gvit2swm2LpTDZUUyDJrsSnlj5PzbwltpgdrORpEcdSFWwKEt8E/7rhk+OIuFiOIasRNSqn8=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by CH0PR04MB8195.namprd04.prod.outlook.com (2603:10b6:610:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Mon, 28 Jul
 2025 07:31:22 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::4e14:94e7:a9b3:a4d4]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::4e14:94e7:a9b3:a4d4%6]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 07:31:22 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.16 kernel
Thread-Topic: blktests failures with v6.16 kernel
Thread-Index: AQHb/4mRgOMLSibtgEqjkONubGGqb7RHJCeA
Date: Mon, 28 Jul 2025 07:31:21 +0000
Message-ID: <4rej3npws4fcz7nrcs3excimhic2hydq5smifiiw6wwjqu5tnj@wkuqeydamxvj>
References: <g4svtamuk3jhhhzb52reoj3nj2agi4ws7fwyc45vca5uykjkb4@glfr4emapv7n>
In-Reply-To: <g4svtamuk3jhhhzb52reoj3nj2agi4ws7fwyc45vca5uykjkb4@glfr4emapv7n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|CH0PR04MB8195:EE_
x-ms-office365-filtering-correlation-id: 73dc5c77-44d1-4a2a-c768-08ddcda8c047
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xkeUkQlWmnv97x5GPBQX9AszrLmaRqw/KM8Q7Mx8XNPqsCcYxsSCVTJXJXhT?=
 =?us-ascii?Q?ISOf992x7vtKtufxpZmraDrtvn3HU52l3r6d2xjH6DpBGokZQ/ieFl5guupq?=
 =?us-ascii?Q?bc/q+5nfOK2xfZNBf/sImcKQI2ZuO+6na4FOp8jcLbD8g3VPw6+RpNnrgM5v?=
 =?us-ascii?Q?Pe/y8ZH3Vv/AYIPTOvIw8rINn6Cflm0bR3Q52+fkehupCNMl9OhPSDL182XF?=
 =?us-ascii?Q?AfGf8fdj9OjGMlS/WG/4acc6jepWmX4Mu3GIqMbaVLTTpSn3O4LLrDxtyi38?=
 =?us-ascii?Q?B50YvsAK7infjgq57Z7ctffKhTNnLOQAxGZXaeSqKdT/a9X+U3XAPPXegNqu?=
 =?us-ascii?Q?l+CHCdIUK2tWY54rVDEorJSv/w+olMrc6or9p5ubF+ogMjVn6E2NdI8eefw3?=
 =?us-ascii?Q?SA26R+X7Rb7E1egXL2CVP6yICMJvl1eYWmEZdxgLpmwq27S9xwqd5Wjztofh?=
 =?us-ascii?Q?KoIUS3JSPv3DLzRmmnd2JmzkReAaKlQajsA/1aPs2fxfZe97jmBtWW21dDek?=
 =?us-ascii?Q?21G7aig/zV90VtWrcgnGmqzYBcyS/F8PEceQjm5ThNEPa1m19GQeExwNwSA2?=
 =?us-ascii?Q?YdJ1ItMHXH3kYDq71n9zwE1/x4dheAyeUrWkhHBUeWCi1n2U2mK74omR/c+3?=
 =?us-ascii?Q?9gWfOYvOXn23RwOyjucNvGyTIZZ3XcXreWEHeUHP8tBwBnRtVltL3DFuBraa?=
 =?us-ascii?Q?BRjZcKPtSzw1JIfhs/3lrJZ5LhEk4OuD3AZwycxGICFRntzcv9nlpEcHHgtJ?=
 =?us-ascii?Q?kE8SnfFLthfMw+aoPQiN7gEGBNBwxr9OWTEceBHqfuRMdq5zV09A8X72AfDR?=
 =?us-ascii?Q?oIbSJbTSWN/d8YtigkZn05Z/DbHvMMCFPgUC++Vqw5BZiLFhrl16SiipWULb?=
 =?us-ascii?Q?/7CDr2LcCHI8QwUesdYEe+5Aq1dp/aCM525idrS6CNWZTomDxhVC4etII3Bq?=
 =?us-ascii?Q?RhrjiweIu6SQe+tbpsD14V4krHEoIBRrYcEbIY2xKYKLvZdAuGjwuaufpZn4?=
 =?us-ascii?Q?XVxTrR57uqMiJksxzxaSSBXcvwShvyFTfLdRSTCvueFRQX7Ebh/+knTS9rmi?=
 =?us-ascii?Q?joe9Nxo1AJiwUilpZa0TUf3q5++exZFJC1H9Y2A+r9DVPZiiox7Kgi2sE/At?=
 =?us-ascii?Q?vGla9nIA7jMyQ3vvbVbJWHGqq49Y2wtkr6TMYmWZcvCe3xP13rXxEcdSQyLj?=
 =?us-ascii?Q?YDckjO1ueKpMtkPE92cVFIEFvS+2sW/vKw+Wn5vSep62COMXgXbc+Rngv7O0?=
 =?us-ascii?Q?wlDxFFk20nW0X06miZYMQwOiL6oe54EawS9/a2pRf5O2TYqLgc4LrnZQi9sK?=
 =?us-ascii?Q?fO3LV/08uZSzOhApunhx2pwqAxt9P9joL+4iG/VxnPCIbsD2yLElIaiC2dd6?=
 =?us-ascii?Q?9fwVCIOY382Z3744pmkwIaKu+dY4KroOV1w14S+nTVsBd+oKTEYng/JwJqot?=
 =?us-ascii?Q?ukrXjjL3xeCV/OVG3e7H4Nb5GHlXmKwwbeTt9hMX/m9+cmuWut9nUqtlycCr?=
 =?us-ascii?Q?/fb0ScLA8z4Ej6o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR04MB8532.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kvc6bizO8ylK6Bw4JKGn7yvRggIbi/KRQW6VCAN/LnsL4SsBTFSJlFyhwXJT?=
 =?us-ascii?Q?5iqnPmsUAMksJ00gPIj/OdR/Dcse21wyMltCOCUf06PX7r4xlqCQWKJy5F27?=
 =?us-ascii?Q?wW/O+tHsyBOc2ThXmUcX/mxiQtRNEeGUa4+w5CZ7nrD4rS+ZNpMGXD1gyqgR?=
 =?us-ascii?Q?BG0VsTVtW8ReXMz5VB234gHVGeV0jpEZ+UkDGkRYvS2hwmORQNWOvhewnMDg?=
 =?us-ascii?Q?91GXa6bTUQ7uq5gjjS83DTfBFkGRCXjr9XrpPY1uqq+wMo5eqANeuDMBSv45?=
 =?us-ascii?Q?Ek6JBSjQUADh+cjfL7wFCXtDoIlmWU4p1cNRugQJRFbC0f85tb16ogDtNGT4?=
 =?us-ascii?Q?Y6TvioAAuV714cFqZ1VX3tnER3oyi7fL+ztrEMU8o4mhgPjR28hU63teJUa+?=
 =?us-ascii?Q?lkJQfwe7jzi/aj8AN1mND7Nxu1obPE1KltZ04bT+I48b6RI3KxqxdiE2X4EX?=
 =?us-ascii?Q?uZVxqQC2Ce3J/mTRmulA9x5dOEWpPf8/oIVNcJD2agNAVOHHBTJVehBfZxgQ?=
 =?us-ascii?Q?XQqElONZvDZdpWw6pkoMz2hiUtrpzL0hluz3ZpALm70YpwvLaNpYVePU3ska?=
 =?us-ascii?Q?a5V+JS0K4cW7+MW58IMnlQqYf3KHKBtq456yxmhYQ1+SFGCpayRIqBigNb5R?=
 =?us-ascii?Q?mFMv5niuAXK7eRYNqky3XnAjias/y0t2oGBMoqZQa5m16iZ5APFC5p+7HAin?=
 =?us-ascii?Q?cV/io1HUI+K4BQ0KJa1ofk+ofRwB8Qa+lKvygCbJpCZ0OhQF6eU/wEKwjGMm?=
 =?us-ascii?Q?zj0QuXDENbENSUZKJgQkNi79Oo5U/T5bTAlDe6ij2LmJbgojrt7sb0v8SZyg?=
 =?us-ascii?Q?tTb4F3QkHKbE3ZFky3nmD0zeN9+9O8JIIjcxDZVLKBVaG//g9NaBvEPlsH1l?=
 =?us-ascii?Q?0brEBFNQuC7syloiV9E14qiiWauGb8jmO/c5/eACllWh8TxhBHxEuAT7F8b5?=
 =?us-ascii?Q?Cu+MSaLyTWW2BBSDnSfZhxVi3v73LrN1OmaC0RQgB4JnwrvlKdQq9UlRhmqy?=
 =?us-ascii?Q?kGw9YlM5lQSyh/S2GA6PzQqxXkWHPbS4AipQk/XCg/izxgBkCCo2BsvQFM39?=
 =?us-ascii?Q?pDVDWGHHAFesCCIsccs8twxLYCQ2gWGulTu+cl3Xont70+SJfwMIlUIaRawP?=
 =?us-ascii?Q?YrayB2+PYKlqsjLOso6iNNqkdLADVjwce7VuKyQB2CsgAiRaHVptJ+UZw4F9?=
 =?us-ascii?Q?f1VMaP6CZspflDTH/F+V8GODZ5CGkNjDENFnOfqGkS4kuz5l5yD9ddJjc8GZ?=
 =?us-ascii?Q?Bve51WSPp09KxCLFyVeCta/hkwvTnGzf+/lp3SznB2g08BM02iDNnAf1AXYb?=
 =?us-ascii?Q?lZBaMhUY9RXD1jj6XzTBV1g3SZ529D4wphESRuKvOJDXqzAAlsEs86sapPPn?=
 =?us-ascii?Q?/3TL0Wzn/P1e3MUiDTt3apbguPgmc5Kxbhr6Q9DvvnEUWdNrpkCP/3h/ATkp?=
 =?us-ascii?Q?9h2xxzptakz5xA4NR+sBYOx+NHAaElswrgH15h/tFaJSqenNwrWUTRa3Pgki?=
 =?us-ascii?Q?yfpStoVwWmev92kYE8qa8jCa32z6AyEGxCFZDQ7C6i8hIk10YXisWrIgmtGW?=
 =?us-ascii?Q?t078fgfweNfk4ikJKzvYHvTEc8yh7xizUCf4ZFu7HxYbHD1g465WOoqAtbDQ?=
 =?us-ascii?Q?sA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0EF3C8D2E2B6534D87B200C4EFB84B9F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cu89AmbK5EqefHsxzg2zghkivLFuv8kpd8tQDOD++dp8SW5T7dMXXi9pgI9U7rLZqFv6X2Ga/NRkqQ2JxcqXIUSVNbxitWwscP7IDOuwJxjvrfiRpgnjru2AkJ+UbF1l1TVu+kfzLTmS/49z5mHGSHCh9BpnbRxg7FPGQzrNtMAJVtbvOY4ccH3RdzCow+V0q3+fYdahcrVTjXbQ8ku1f2GpcP8FA5aeC6Tcu/d6wgGW9MqgKAj89qkZKjsZCGaimaz57KWx8sgrr/b0bJihidXjJyjktxIzHq+GSw6NzOwiy9/39cOmHVf17Gu0Y+EbXBkQ9CN0+33EKSK/y0/AwM3WfYx29UVPgaD2/klavBV5i4HQHWxh+Rbpz2xQdIYIUFV813FOfd4QkH/mpEFedFP/2vrcl76RJNcO5NfBTELtIemFuj3nw7WCXKZCJzZyJfkT2YvADurFFQPSoijW+pTu3KByhwWWXVEaOO5ANVVcd0jq90iQxPDir8gW804spkpJM92A1lth7vHtQYZsgRJ6rWKwp9DvokXlnZtWjg6WgAC0GTuWmqJbzbTqiPW7Yg6bElOGVXw8HXelmZ8kkTdr877XB9AptdoEE3QN7UB2W9ZD9WTV6qv4iSsBg0rP
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dc5c77-44d1-4a2a-c768-08ddcda8c047
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 07:31:22.0263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2HinNVfc5jpihkjRPaHzXXXDoNsBPyHHcXc/kmRQQh0xtq9reVnennWoMiJdcWfodjjnfrr7Cj06hpr+/cDHM+CYOpJRvDmGxgyJeGKRu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8195
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nPcN373y4EN.A.1YzD.iyyhoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3419
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4rej3npws4fcz7nrcs3excimhic2hydq5smifiiw6wwjqu5tnj@wkuqeydamxvj
Resent-Date: Mon, 28 Jul 2025 07:54:10 +0000 (UTC)

On Jul 28, 2025 / 15:33, Shin'ichiro Kawasaki wrote:
> Hi all,
>=20
> I ran the latest blktests (git hash: d24f7445c575) with the v6.16-rc1 ker=
nel. I

I made a mistake about the kernel version above: s/v6.16-rc1/v6.16/

I ran the latest blktests (git hash: d24f7445c575) with the _v6.16_ kernel,=
 and
I still observe the 4 failures. Sorry for the confusion.

> observed 4 failures listed below. Comparing with the previous report with=
 the
> v6.16-rc1 kernel, there is no change in the list. All of the 4 failures a=
re
> still observed with the v6.16 kernel.
>=20
> [1] https://lore.kernel.org/linux-block/4fdm37so3o4xricdgfosgmohn63aa7wj3=
ua4e5vpihoamwg3ui@fq42f5q5t5ic/
>=20
> List of failures
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> #1: block/005
> #2: nvme/041 (fc transport)
> #3: nvme/061 failure (fc transport)
> #4: nvme/063 failure (tcp transport)=

