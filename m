Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C5424ABFEF9
	for <lists+nbd@lfdr.de>; Wed, 21 May 2025 23:33:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A5FDF20B4A; Wed, 21 May 2025 21:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 21 21:33:13 2025
Old-Return-Path: <prvs=229f646d3=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 221F620B30
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 May 2025 21:15:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.889 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9becd87yr7rb for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 May 2025 21:15:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 438 seconds by postgrey-1.36 at bendel; Wed, 21 May 2025 21:15:54 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B9D1220B2E
	for <nbd@other.debian.org>; Wed, 21 May 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1747862154; x=1779398154;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=VRGSvXFr24b1p0+bA4eijRSBeznJQFt1J6YZMY90Ht8=;
  b=IctpbEK3PVvvwRbPPsnYcaO0gTCf08/En1g1Mr/V9epxE80TZ0UEugfy
   QkH6etahTYUywhd5qRkXhUekPVcGIKc8ZggeWcrQJ2qaTpQaUfouQ/sH5
   PfcxdKvtYJs3JXpxLIw+fEJOAtD176dArfAAJTEWieWzETHy4iDOGFevj
   lnsXwGiYdlgUkpBXkCZOJdEIX3HDIxjLDj4jEK400BmHexB2H+1QAa88/
   shLu+vbTgzfzGqYQHGACmGMy7e7mRmaidgovNtX7kfZyvcyO2NwaWxDO9
   FzyhI3pkSni+boIdus74oYjxba4cFWvhHU4zkZkrvz5qk57MsVqlLp3dY
   Q==;
X-CSE-ConnectionGUID: HDmNOXTjSzOclgecJZGyyw==
X-CSE-MsgGUID: cXWL3w5VTWy2h50vLgZlJA==
X-IronPort-AV: E=Sophos;i="6.15,304,1739808000"; 
   d="scan'208";a="82189951"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
  by ob1.hgst.iphmx.com with ESMTP; 22 May 2025 05:08:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUsmdlL76x7PXODxTqlka6W3RBNLnn8n0ENFM5n2HKCuX7MNB8UF8Zqo0swNe3PaoKMOrm8RLwzRpOz2AY7nJjNb4n3Z55sbVZMbKGpev+IholXapRqZr7w6Tjp3GBokNa3EdUUw1OWopC030hDroTObab9hCmOGg6ePdAlDGghpJ1XVlMTYpnYo3W3HlQaa4ETYG/bWhywiIlX8x2++g+2zi0oLg2xBMvH4DwLfwpzvhIQmdIXPgmzorTX5Ui2cJgnWLmj7QlWw/LRkc4fKnLEx6EQ+/4PypHPXXrPWBQvm6R8tIapXQhb9hEXjJIuHEFWz9cYOBOYfEa/vqsdQUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7qkFDXAucTi4Y9JjWmEbLAclcjvIkmn+WFX/gQ+z2w=;
 b=uoOKuo8iLlMzOGgAWs1wh7/WohmULzOBI47EvpAEREnvJT1uU/xXUpZM2MGSQP9Jj3dcu6KruWSm3GgHb43UmtuI83XSL8Zir6vH3lgXrvttZyMX78B6T7iI2Pl3ga9YSuBnvzuioIwi1wnglUmk7hfMIRe57K8w9ytUQXWHwSWIxE+cBUqBd2cCeHKR85C+nbhmSzGSQzIluQ+GkbHciQvM4okwAzGmjroZISKR8HGRZ39ZnSVwra2q+uyaiNuquVT75yIoFyM198zGplKiVinRDG+mrmXBB6QXdYpqYTBevx8REGcHg83ESnpSf087CGpzOrYlopxhUu2b1ZrVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7qkFDXAucTi4Y9JjWmEbLAclcjvIkmn+WFX/gQ+z2w=;
 b=n5QyATp3ZTTsyKwUvv4rVkb+auixjwcuEhBm8q/R8se9icJa5p2R/iaHcE9Rpmwbh9pSKuV9Ubak8Ek6vd79fyRaPqDvyYRifeThWrztMgbrZVtDIkwI+fvGB5JJoP5l/iZiad/6fdtqWkoxo3b2yCSO+qFSqzmOhG0jZkkhXVI=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by SA1PR04MB9020.namprd04.prod.outlook.com (2603:10b6:806:37b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 21:08:30 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::4e14:94e7:a9b3:a4d4]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::4e14:94e7:a9b3:a4d4%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 21:08:29 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>
Subject: [ANNOUNCE] blktests repoistory move
Thread-Topic: [ANNOUNCE] blktests repoistory move
Thread-Index: AQHbypSA/Tc20EMek0i3PG4ZJvL8AA==
Date: Wed, 21 May 2025 21:08:29 +0000
Message-ID: <rl6mkqchfjfzylyrfie7d52gxetnvh6r2wpgwi3pflbl3v3duf@cjielnfb5rht>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|SA1PR04MB9020:EE_
x-ms-office365-filtering-correlation-id: 4bfaae8d-d982-4a67-e579-08dd98aba2f1
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?I80GZkA3mwr1goThqhkr9WrIpPSKb59AbDv4eZDnA9dlAqjPEvvan0attWfk?=
 =?us-ascii?Q?llTnui/oAan7DoGNVdJv2Or3x6uq2dqZFyC4+qVCFQpd8YmVmf4KVbpVH+BF?=
 =?us-ascii?Q?f2d6DsiGkSTYO0O6e6Q1qvigGXPg4AawJObRYdynUnVtWWTqF38gIxEcLfvu?=
 =?us-ascii?Q?aj6ijC8VddN9QWdLJuZNIQCBaP5nIAdb0IFskO5BYxStrsuGeI8QdsBBj1OD?=
 =?us-ascii?Q?YLv36aQMzZXv/t+fFbHQM1/EWZgr2NXtDV/mYPnWVSjSWVf3y3NHa1o2OvVk?=
 =?us-ascii?Q?UbzoJuaFxevn9vbLV8BGdzqsuc1kAuhqCE19GhWUkef8Il1LOoItak012Zg/?=
 =?us-ascii?Q?eao2oX8iqPjB2sK+UYc8P46GtdKhF5SVFdOZMlMHNDkC+P4dmTgWCNfJpLIK?=
 =?us-ascii?Q?NR77hR1vsr3LxM01iN6clTxidrCt4pH7wGtBVyDEnIUneD2Kh6gNpe5n7iFp?=
 =?us-ascii?Q?O9cAc3Cf3vdZxmLIOsaqns5cOIRVYztByUPQGfO1ZKVJd/aHDtjEeLfm73bb?=
 =?us-ascii?Q?dYX/lq9a/YFhMSgoa/ZZO2KB1JFImA41DeaHkN5EDIpwxsHADxuj9ioLOUjQ?=
 =?us-ascii?Q?9WMbTO2ztVE0Rq0mpuJC8C3HgTYGJh4ZogyLFnr70pah0EJi4nBYV2oqDfSm?=
 =?us-ascii?Q?8cqePHBjhddVHEvV213m2+rBVAbRmCEPHb38hkqOBueYCVPZme+o02vypUh5?=
 =?us-ascii?Q?E51YdNTDutR3iF3b/1HQOJ0WOPNewBZsStA2HrHaMzSaifuD4lHNMArBslKe?=
 =?us-ascii?Q?0HYcV58UCZatzMT6XEWR8eEBWQWXE7nadAydUGsrAEGabz0qKhAG/cvfQ7up?=
 =?us-ascii?Q?5P2mDHsU7CQAs3Niq1TYFVksQOAG54gnGPRzQKZsnTS6Iu/MldZEpTYRCLSQ?=
 =?us-ascii?Q?NdE3j6mydXlErG5chK5cJ9omeHHSDmeGi/UeC/67Mm71BN5YJv2ElIYXUIr1?=
 =?us-ascii?Q?wcckDVcRcw8fQJdW6U4rBeHzX22+Z74IIOgKfpaDhW8OBM1CrwEfnmrPkvKD?=
 =?us-ascii?Q?l/K3ATZ1ZIsej6MAgGisMfyrXrKtt73/OQGwdnlB9xFjoNDfNBHg7cPJ0lSZ?=
 =?us-ascii?Q?lZXhCpnTL2ve3DlHQi2jyOZl2SlzjRMOKPKCmA6LlRtexaLXrRV5dDOHNf4R?=
 =?us-ascii?Q?iOWLnWF0vvWG8CWn2zrnSvAE313guRIyd7zwzeZz2LISWIsW0c4wSaa4wlpm?=
 =?us-ascii?Q?IDpkCaieBRZbf2f9XI9zvGYrpdrr3LYEvvR2jt7td3UJ5/rNjjylvJvy8gbk?=
 =?us-ascii?Q?sizIZH6dzBZcMpGyaDTFi981H0MmZaXNTNh9iej5k0YopqcH4aMR0wlm2KkV?=
 =?us-ascii?Q?TLU+GZkoWUpMnJpoRg8WFqALdrJDXJBEgRSCZA7JHg505HqGkUm5oJEDev17?=
 =?us-ascii?Q?qnaS9JUqRz3a6PzcGjnOzKR7n9+0ar5qe/RWPX8izXXd+CZUgif+o7O/Ui8g?=
 =?us-ascii?Q?BdZoF5d2ldLJMnObTmyr9/uiiPl8s/uG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR04MB8532.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cfL7PH3xzUaMsDOc13+KyLpOflxijRrf4FXHVeFJaCh2gj2PbBvxtqGD864R?=
 =?us-ascii?Q?DoInZG/AdDnRgGy7d/CTczQ0bclrHl1CwRRMCGQu0F7MSljDQJuDlyNSlbr2?=
 =?us-ascii?Q?QTus6n9YxgZLGL02s0aZkaY8ok+zMi/QBc73ueIkUXez+NTq4MyakSqDRBg6?=
 =?us-ascii?Q?gasOMEsXAxF2AHjg7c2O4B3sGnbE6rKHCWhTciJVK7hBR1rvaR7KqrdWorDj?=
 =?us-ascii?Q?x7KdtQKmI8fi+F7h2Ez5bGvGKxho1pnAaK/rGBqt3dfvpbY0xBEUg72xTRqu?=
 =?us-ascii?Q?Df6V+37mx5bdgBR8PIGEXHwAkr4tOrbD2zMguI+KMDAmxOvpiPsA3jSMvfAh?=
 =?us-ascii?Q?NJasvsIl9ye9dQFjjRFdRnYOr06/D1yod2NAMPfnCGfCijN3/Gjk0R8WJHN2?=
 =?us-ascii?Q?y4eaisgfRbM05jWSUcfJMOXC5x8kdUmg3ybi9CL2tCu1kyo/gwP3EztAX4LC?=
 =?us-ascii?Q?gwDlsxcYR6n1p/Je640ItNb2CVX/UXawiX/qDgXUTLuepxV2ghMUMiEYAlOZ?=
 =?us-ascii?Q?qncexkiT2mlLddN8ML5kvyrT32H7v5mU77x+y2tfa0kQFbho1HpxguvEEsV7?=
 =?us-ascii?Q?IXSUq/A+shyKF1kw0ttoHc+V2vo9MqPxf8rkKJUP6+JFwFL7vxP9qilX8G1s?=
 =?us-ascii?Q?PVIqSPc2irZpfejPX7OFngmJ1XvreNNtOVsJJ3Xp6wNe57wul0z9GeCM0kmL?=
 =?us-ascii?Q?6LFW+RrmaUOuS9dPRzKPisO+SpTMY+tmAQyJdfBo/y3rTHsTMTuBGYzamkxl?=
 =?us-ascii?Q?u4DcRtIVgpShHJcxTY+RY8lwXfRNnTTmToo8oI8MDcKcBzScpi9dqf8c+RgO?=
 =?us-ascii?Q?bOHnh5lhrwGj9l47m/dh423mN8bYrf5TSKfzwfWc4CIGNGl2Oj1xNweCinqb?=
 =?us-ascii?Q?qREzRrnxDYrhhCFTkxt9sJle4oRdsBHhFJdT6eBtozyf60CqKlRKRYrcHOZB?=
 =?us-ascii?Q?O7GiQaE10+NwWDJt3/pBEnvzvq3WZYUNXidcXBL+CkU26CL25yOQbUYm5XFb?=
 =?us-ascii?Q?BupsgmZePWOswqRUkIST5Ra+fbCpSgFYrTecUXMOUf0sypmheuJpVjBhZklA?=
 =?us-ascii?Q?sEzNeImlQn4pBCv9XLDpq12L3/iFdD0PbFB125CymqKkWrskSfpXb3Mj0RaH?=
 =?us-ascii?Q?vGJC16K51fro9YHb9lfdtmrTdF+WYWQPd/5GLrBH5DiDECXQyL0llscURg+Y?=
 =?us-ascii?Q?+seW5Fe74Dn8HOlJlFUlDyykLxd5GRDneP2bZ4Rx+FbmN4fnWMGZNx5+XjY/?=
 =?us-ascii?Q?VbQZdIhN2vThYBq+D/kZOXek65RBPi24+6UpJ57+x6TIb56IOdvTGrbS3TaT?=
 =?us-ascii?Q?3GbgC4UBNzHOV/CZq5Y7b/EKLLeromJpVogxRD69PYwzC7xDqhwcYgXqzc+6?=
 =?us-ascii?Q?Qrt9uEjlo/JGaPTVytJPWSDRRuHM0LZBcTF1Dy6EMcgRDktsF1YV3/cOuXQv?=
 =?us-ascii?Q?827t/lM6+ERxKZpVKLc6aTDUV5I+tiWDsBpZm+J60NUPbnQ6/tVs0SGvXVAA?=
 =?us-ascii?Q?l8aUPUdK5rXEKvdGXUWpjvgeTtFPCsyCk5JihW2t9CZRzIGxyiX154QUYq4T?=
 =?us-ascii?Q?yDvhpv4DIDBX8jtOyHkuo5jyeNmkos+NVwTSw3ddEvi0GZE4Yq2BxGbOPGmq?=
 =?us-ascii?Q?tkfacOx42mwIXPWiqGFxLB4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <433BD22693C3AB4FAEE35EDB67ABF90C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/e+Ru0N8VZ/aQIYLruUwm8FfNLOrV0ivAgYA+tzU+5NsqcZOdrvk3Wre10pqbr9GKAhMeZYpf0KXKCi9GWJ/hOaKUCXV0FiU0JK+y31zqlLojMBKmMVAWR/Fs7ElFJC1gCuNlxkQYH0zk22EAk6mGYdJ3TXAyEbI5Hkv3REwJnKmR/QAkfF1N/wQuGrAsiADzXbDgimreJU/ppArkMznE890ZF+Qf+X9VpsZaInXQ+788zT2F9MoIEx8U0L0+MMuI0RBLlrsF+mzEpA1xvWOvhLkndHo5dB9/9hnnGtcKBrQcgwEkUGnibDko3GH3r5e7iayeZjRt3zyMLqzHbXbgVnR5Yp6NHtEvLHGkuTGirBz+9ZUK/UliUUkn1O7mm3piRaLnvep11GakfFNSI4Uw+rYoJpv4UAwaBxwSyi+4XxQgdFYmXWzDhddKMh68sTACU0YSvsmzT5XvLG9Z7BN8uk1sYWLul32DZBUPyOKN11alAHYOCQxxegWaJ0IJv281+GbmzKyggG9mS7WyS5wFOyH0iwB6mVbROV0pZaDJ1HMBzU0h5gmlIL1HInfOJMa+NxpdjSJby1mE3tUexwfcEfiIYz5anhCYntNRS/3hh3f0A4UhJj6lgCNt93ryz54
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfaae8d-d982-4a67-e579-08dd98aba2f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 21:08:29.5744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4dUejiOJUlTFBJ7UWLw/y1TjRaD7L7/wKDpFyY2mlXz2wTqcJsNbxSNOUo0uAleSfudySvAtOZndL+zXEphRAn7lSMvMovzxzt6QOYnXPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB9020
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VENAKWoxMJF.A.vc8L.ZakLoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3377
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/rl6mkqchfjfzylyrfie7d52gxetnvh6r2wpgwi3pflbl3v3duf@cjielnfb5rht
Resent-Date: Wed, 21 May 2025 21:33:13 +0000 (UTC)

Hello all,

FYI, as a preparation to set up blktests CI, we are going to move the blkte=
sts
repository,

 from: https://github.com/osandov/blktests
 to:   https://github.com/linux-blktests/blktests

The move is planned early next week, around May/27.

The move will be served by the GitHub repository transfer feature [1], so n=
o
impact is expected for blktests users. Old repository addresses should be u=
sable
after the move since they are redirected to the new repository. Just to avo=
id
confusion, it is recommended to update the remote URLs in your local clones
after the move.

[1] https://docs.github.com/en/repositories/creating-and-managing-repositor=
ies/transferring-a-repository=

