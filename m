Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAB97C45D
	for <lists+nbd@lfdr.de>; Thu, 19 Sep 2024 08:36:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E34652076A; Thu, 19 Sep 2024 06:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 19 06:36:10 2024
Old-Return-Path: <prvs=985d48ec6=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,RCVD_IN_DNSWL_MED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BB3E120733
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Sep 2024 06:19:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.871 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02,
	RCVD_IN_DNSWL_MED=-2.3, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vgaWQFEORdN2 for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Sep 2024 06:19:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 438 seconds by postgrey-1.36 at bendel; Thu, 19 Sep 2024 06:19:50 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D1FD4206A5
	for <nbd@other.debian.org>; Thu, 19 Sep 2024 06:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1726726791; x=1758262791;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=SC0vNDE7JX3yjh+BPigLI0xexSvSNSZkZImdiUZgwgE=;
  b=pL9k/uNlO9fmXZ4j11fEkE7P5YhtZaFXuxNRCTVg/gGcEWZUF6cNT03r
   X8vWmwM7qzJeMEX1GJWK/uEKWHGZw504zpIA4G7u8RkOefQWztHuhq8kO
   vI3IjA2bwHLzkY5bq+ravKLxNXwy8el8ppqjCcLC2FEDInRYoLGeJYZ3+
   xJ4VvS2V7IyVCG89bqnB7F1xU9F2QVqgaR3ZPn+0qMf8FwBOg6eCrTQdF
   K0ucJDCx6m9AUo4wizRnEPMQBrXmm5LysuLI3vmx1xCQgv4zUzcAj3DjQ
   JTFZMmw+RGbBZvUaTAgwrFYN7L52nSsR8iM0gFAq9c4t7eo6pcb8TP9UA
   g==;
X-CSE-ConnectionGUID: Y4E4jpCsR1i2ZIapY9nqBA==
X-CSE-MsgGUID: ebm5YMBsTLiHk+bzsYbrpg==
X-IronPort-AV: E=Sophos;i="6.10,241,1719849600"; 
   d="scan'208";a="27894630"
Received: from mail-eastusazlp17010003.outbound.protection.outlook.com (HELO BL2PR02CU003.outbound.protection.outlook.com) ([40.93.11.3])
  by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2024 14:12:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPzgVqROukoobdvYxz3JZj50E7RTK3YWy5mXBpnvoD3PcclQ7wZ3gteYIjt0OpqCrVj5vau6+jeX9aFjYZ8mDrV+f6W8ej6ghsIfd0byGJrEAo/+M+qtp91TMaCcT/ORZrwLgDeoIADV9MQyPrzYPaERmB4RZYT5NRnlpslnKRO0qI4mxpOgDfHr9cB5UgkEdvOPKdQAVASM7tHobcbE06U3AO6+chQIgrEQqb7jExhaRi5UpmRJldKPfi1LiUiCcY9LoLYFpdE5J2por9v+fNaEuYirVxAVxtrTy0WhNc1oFgm5ePtgLhyz6NnFCi6+bKPP1OugZMVTCO8THbwTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUwa5MIHFhB+EjaJbbzGKnWl0ut/ljEv/mGHxoNGnzg=;
 b=axN+8k30Jb3s8WinZNVWrB5+ImxtvmFHzx0Onmgx27u85bka5scnTCyQMTxDCHa4r/fjU4RGZ4KpYbZfkALqujHaYHnPt7XNQwSqYCddar5eyyx0E6KXDbbDhR9QE/5iDn8WT+pyP64G+PZRU3eRbONox35Tq1SkMHVEofVJ8OWsV54daKNvz+dDY2U+atElq/BD+GYEj02Qp6su9Sqtg0zzojNql0vTQD+qYiCDpC6kcAtbDLninO2lfyOEqFWv3zAA6z0i+XfSkPsVPjZ/DbuxeHi/BCdZUWDgVzchwBsSTtPzbnAEp1r+zlj9jyKSYnr2qNPp6LDC/EXnVyb5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUwa5MIHFhB+EjaJbbzGKnWl0ut/ljEv/mGHxoNGnzg=;
 b=FNS3J0F7dwhqVHJll2a7woYRjHB6B8Cpw4zbfXfLW2Mot2tGyXzzzXA7op0vsgRzvfN9aTuw/FTmNowNPAjBNSArfMTL3R4qyz1KU8D7RMGAgNXWUEV756WQ6f/8pYOa+XIfLazon8/YrA4xxQaPWWiMQQHozxrmEm/V49k3/44=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 DM6PR04MB7017.namprd04.prod.outlook.com (2603:10b6:5:24e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.21; Thu, 19 Sep 2024 06:12:22 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a%4]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 06:12:13 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>
Subject: blktests failures with v6.11 kernel
Thread-Topic: blktests failures with v6.11 kernel
Thread-Index: AQHbClrcEmmjPrUiAkCpdRp/WaghZw==
Date: Thu, 19 Sep 2024 06:12:10 +0000
Message-ID: <3aydm6iazrkdxb4d5yb3tc7fjqax6nvukrn3tpvzjcom6woc5g@qbai6zlvsrbs>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|DM6PR04MB7017:EE_
x-ms-office365-filtering-correlation-id: 1e924fce-84d6-489b-8767-08dcd871ffa5
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2yd6Xj1veNmH0FuiLGPJQfEFE4YahGQJ3BjttrKn2eslZ9bNGhPWi7+RCYqR?=
 =?us-ascii?Q?pa3gnCaYIottgaLxjpdcwLeRW7wh06Lm5G77QU1XqrZ1HQYkVzF51JSUXBHs?=
 =?us-ascii?Q?py0fpNc0UT3D2StCnm8JOTVLgX4DhelxRtV8lSeGcPHp7LI/hUMOVkqOFyc4?=
 =?us-ascii?Q?EPelyWcHNmFAoTAKKlv1XNRbQlU2L/dplWrboZTl0MguQaFFRgec6DLsYW6u?=
 =?us-ascii?Q?Wd7TcnaLYMAQQ/XDrH1rj9WFo+Txw4vmXBblyU9aZQv1T3nCFrLU2osUX2P7?=
 =?us-ascii?Q?ANRW4VV208mphXqJsY4FzVLlyov9sXzDKjohkuqsgYVVFn3IFV754Wx1WnmF?=
 =?us-ascii?Q?egH5wFhx94PDUPdVZJf8KZGZXTJv7F3YYmGIURe72A++0I7jEWShIjggtHcG?=
 =?us-ascii?Q?x1lTe1NCU2Q0D5IE4kNg7kbZhcCNQfckfGZhEbDIqtantmwkq2ijvc07YHet?=
 =?us-ascii?Q?nxF+/s13ZgF9snF2ywjZoQfhLmiH/Q347cx8t95vpSJgZmdLZr7JV3l0cFVf?=
 =?us-ascii?Q?irtF+rgEYIrg7db+THkfIjrIHZ9CfRiJE+QLdbTiS5Ehyj0kT+BGJSCBKzpS?=
 =?us-ascii?Q?mlF/+5BITfDrK4sj6vHaarjBarXitLXB+jUH1PXfsfAoz5i4iuAuHtOVOQ5t?=
 =?us-ascii?Q?Ow52WwnXA2YF0dnHAWlugm6SmFsrLjc9MQVr3UZahkRxEdFnlw5F1tZUjZQ0?=
 =?us-ascii?Q?dvJjo+hoq37KP5ynSBxz8BQMP8JopG+7pMt95CuMwxNXoMyaIZplGP0Zqoqp?=
 =?us-ascii?Q?pnrEIoZbcRcUph/6Tw91cAg3Cffy+sNMjHR1zhj5+Vi8CwgSlSwu5ok++yrN?=
 =?us-ascii?Q?dYSuAvDjvmD5hvFHSKAkczdROnul4hx0uYXgmxcDdM28PE1OqPnZE255KKRO?=
 =?us-ascii?Q?ym5JZDOxA5HRfn9EPbWRUu0YW4A13yU2STmscMvM+X4TRCIQ/0duOoip/ErY?=
 =?us-ascii?Q?JwF2cIs7MQYmvlDl/q5u8o2xoH5hUEFTnEk07hwftXoAqtYIFmQwf2uSXTNM?=
 =?us-ascii?Q?K4JDf11BEY3eCDOf/Yo1DYmtjpQOiIv7tn2Y5TxdyWhJrF1VYNfY31dMLkBO?=
 =?us-ascii?Q?+f8rwOuNQmNs7zIJr1Hr/5mY5uRRHlhrbk+1PDukRBcmZFR6P4rzWxTO2BM5?=
 =?us-ascii?Q?/MxblWb+Pv/nNa+vOGm9+VLPDDK9yKrb6cEQZHcaiyEeAkxtgScfQTqTQT/t?=
 =?us-ascii?Q?tGBewuypjOY/h0TTWVWq9n0d1e8Dw2lV+ol2QCuDvu/bCSY3rYVA1Y3arC0a?=
 =?us-ascii?Q?7FhXQGp+zTtj++myXR66xOtBDGMfb/gAF6y7qh/NHPkYDEWFcCpih0O7tCM3?=
 =?us-ascii?Q?Wst2GhforBZIq3oaVzMpA6E+slywDpCPXf5vBT6ki8ColDLjYfuGQVAR8K65?=
 =?us-ascii?Q?2B+7Adc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+XRg5h4n0iBr+I4UPeh0p5vJycmJLKP7Oi2q58Qly0Mtc610RgS+PdvpPzYw?=
 =?us-ascii?Q?volgLxxgKZBPHAYnmn1ZzAdRyGlSw7rZl+FomE+qr6xLsJ7yZKa74RaLNtfj?=
 =?us-ascii?Q?hbpAT14up9iji+42d73EEVRdzPKWASbpu+VNi1ge8UEA5ax7lBM3ZQP7qHAQ?=
 =?us-ascii?Q?XwBdbUV0+UddCP8SFLeU3G39kw1PrRLgFfmcFdtpH3zUGTM6/8I6MO/+Jwwc?=
 =?us-ascii?Q?d7ROE1TU2v0y2VHzChmedVSxP5drTsigIufUIXu3Ip2VCo2bHQoHvOPIoB4k?=
 =?us-ascii?Q?grEbjvYVycypVeWA2kZZ50yA1p+99z/zyH/0JR/p7dftMuCaMnygkjI3jNwe?=
 =?us-ascii?Q?9ZRCtASA3cPmGSDXX8i27dlsKUl44kumMdX7LnoEDzKKLjvK31REKIZ3pGsr?=
 =?us-ascii?Q?z4OKWmsGxYm0X6Lj8mM77Q9EWL0Lhl/ww9G92b+t70S2rmWMtjglq4jxWj5T?=
 =?us-ascii?Q?TN4EWYqttEabhs10flBjCM78+BwqdqWzZVZrMRdyfgqZoouYYRdxAk4N7r8r?=
 =?us-ascii?Q?ye+4nacFJ46yLN89vRf5LVMNYCczd9lLKdR7k7FZZNjZmNWUihTkdJ9wB0ZU?=
 =?us-ascii?Q?CANiK2b/6ie1IvfxNCrmAyLVEBUwcdiGlxvSOgt//qujYWv32jU5y2MOoW1B?=
 =?us-ascii?Q?0fbprNXJa1l64/DOid7EqMSDD0yPPjzh0gytc7DhrnvOOYDK/zPVTAULjlhc?=
 =?us-ascii?Q?GSzE9MwLZpSTHV0Z/Gxm/nIFA9/a20qGM+w7JCi0fe7ot0H+MDnoobGe3oLL?=
 =?us-ascii?Q?ny98kcrQ45BfVAV7uFtf7ZcpzOCjCgEMZMgjLdu7nPTQ18RvjzRL18QfeehO?=
 =?us-ascii?Q?utkSzM5wlXlSWK1tdiKTPfU8GMmUOhPMoQGgUWHGmfxjc0A9keDFnKRy4uef?=
 =?us-ascii?Q?INu0VJ54M7HmwscX+N2zar4vmc18W2aHEOLnx6cqCloyToAyli/eJnFRXwkL?=
 =?us-ascii?Q?CH2E6srw6KT3Dw9KIa86sL13rPhr/RUh2OyGv/PF3Hub3LfJh1yz/szv1l8R?=
 =?us-ascii?Q?bltGwaepIrh3SDkSaBSbdJpX4q4+CycR26PY045F3YnvvRH6elH4NXfW3SE8?=
 =?us-ascii?Q?S+6l9JgSEhPpsGmPDIPpnGzkV00wGmthy2H2BSfYeO/QZTRPHCZgUnKZepj4?=
 =?us-ascii?Q?Tl12BbeqUdGizH7hntxjah8Z/PImRkrArAsxrPS9XjzgVQFFxSfxekKtcYqq?=
 =?us-ascii?Q?imYbeCtvZJ2E9XUgu4rl46lz+m1iofLZ3ApFpQwlGo7RYkvYMAwzy5dz6Vbf?=
 =?us-ascii?Q?HDSkVpbKsILxOsQqzIKQHqLr4rzUb80aLtR8IdPGTn1C77HfC1gO2CADFVxb?=
 =?us-ascii?Q?p6GR8eWVVBRVK0TBDiOo2NecUjMI5vClNkP0llCDeoMH9Wrxc94DItzskEjD?=
 =?us-ascii?Q?/bDPlGerlRLv2NUGntWC8jvK0cW4AGMqQLuSUuUwJJZcQzyL0RcKwqOeNaaM?=
 =?us-ascii?Q?ezG/qSys/KDORYNJ71mObEvM/zKMGEe2BHgYmFKXTMpZTy2nH826ywBcwnpj?=
 =?us-ascii?Q?KXCHx95q44Gv1qgfzMwOmGcrfqorXjOCr33VTo70pOOJR/TqM+JRWKkECc5i?=
 =?us-ascii?Q?nsT08gLeKR1C7l0s9vEeHArmVAB6tt2T9Y03nYIKKGhUshaXY8rm+dWPdBhg?=
 =?us-ascii?Q?WUqWD21Xs8PlexM/6FbatcA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1080E8D11008F4D8C7D1EA26990C868@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RKtUj3R89VLUyGzQ/O1LUcTe+xjKl4tDoProGhQ9HKaXUgPA4iV8JYoAuI8oL7BakkOdXXwihhU79tvzshf9z0x6rBY9ZYsRkXrzKmlI0eFBJnPFVqcfPnvKOkUBw7jOrRrulSNYtS1aYPx/HAI531vCJzK/fXIDOrmEIRgErjoyqEkORlUU0bVHffgUatZk5uhjgGiE/gsKBrozGb41xlPruoRa0dkmrcQxs//yfMEO3lXILAE8D9KBIT2sjufvNHOQJzs8R1r5WqVrOnKF9z+G8lV5CXBQuS0dTVStn5rWN/JLHHpsjmu3a23/uZr4LJQ9hKQjPZ0pdOMSQrjtiYZTJZf+gGQoUooGXNT3Rqvt+CmnRIxUW7D92xftLbLbF7R+xNZ56ZNQ2BN4r4iSp0xncSs4wCmOHw8FiB1j+uE60VLI+Y2t2T9FB9LwPXRY/uwX/dbjhGCyi6Z+4YNBS8NNOtaI+IqDj4RtsxtUZqrZvt1YsxvFdAkF5x9PlXiho02caQBqnLM+zJ2NdeBUm+qYJ4bliwY/u3XzyA6l4j0cOVlHbYs15ru3VoREw91D4AnFG0pIDAKbixU8D8hBPC5WW6YpwfOYf3EkFBpdY2Pn2HVIZMRBqa5vB4zhZy+x
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e924fce-84d6-489b-8767-08dcd871ffa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 06:12:11.1192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2O9Z7ahwCqnsQXGjo8TVKvhOKMH/h/B1ZCebctCCjIW3h9YEw+OXJw8RIOb7xBjSrCqiZHCm0Pjhea7PA9zDdeENw2YvBrgo5PxBRnaqoo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7017
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Hk26pxdrveM.A.c1YB.aZ86mB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3149
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3aydm6iazrkdxb4d5yb3tc7fjqax6nvukrn3tpvzjcom6woc5g@qbai6zlvsrbs
Resent-Date: Thu, 19 Sep 2024 06:36:10 +0000 (UTC)

Hi all,

I ran the latest blktests (git hash: 80430afc5589) with the v6.11 kernel.

  This time, failures reported by the CKI project are not included in this
  report, since blktests run by the CKI project for the mainline kernel loo=
ks
  stopping since August.

Comparing with the previous report using the v6.11-rc1 kernel [1], two fail=
ures
were addressed. The srp/002 failure was fixed on the kernel side, and the
nvme/052 failure was fixed on the blktests side.

[1] https://lore.kernel.org/linux-block/5yal5unzvisrvfhhvsqrsqgu4tfbjp2fsrn=
buyxioaxjgbojsi@o2arvhebzes3/

List of failures
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#1: nvme/014 (tcp transport)
#2: nvme/041 (fc transport)
#3: scsi/008


Failure description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#1: nvme/014 (tcp transport)

   With the trtype=3Dtcp configuration, nvme/014 fails occasionally with th=
e
   kernel message "DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)". It is rare,=
 and
   200 times of repeat is required to recreate the failure. A fix patch
   candidate was posted [2].

   [2] https://lore.kernel.org/linux-nvme/20240912062707.1759715-1-shinichi=
ro.kawasaki@wdc.com/

#2: nvme/041 (fc transport)

   With the trtype=3Dfc configuration, nvme/041 fails:

  nvme/041 (Create authenticated connections)                  [failed]
      runtime  2.677s  ...  4.823s
      --- tests/nvme/041.out      2023-11-29 12:57:17.206898664 +0900
      +++ /home/shin/Blktests/blktests/results/nodev/nvme/041.out.bad     2=
024-03-19 14:50:56.399101323 +0900
      @@ -2,5 +2,5 @@
       Test unauthenticated connection (should fail)
       disconnected 0 controller(s)
       Test authenticated connection
      -disconnected 1 controller(s)
      +disconnected 0 controller(s)
       Test complete

   nvme/044 had same failure symptom until the kernel v6.9. A solution was
   suggested and discussed in Feb/2024 [3].

   [3] https://lore.kernel.org/linux-nvme/20240221132404.6311-1-dwagner@sus=
e.de/

#3: scsi/008

  Due to a kernel change, IO scheduler can not be changed to "none". Then t=
he
  fio command with --ioscheduler=3Dnone option failed. A kernel fix patch w=
as
  posted [4].

   [4] https://lore.kernel.org/linux-block/20240917133231.134806-1-dlemoal@=
kernel.org/=

