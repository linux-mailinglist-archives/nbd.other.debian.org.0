Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 337BB903B75
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 14:06:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2171F20580; Tue, 11 Jun 2024 12:06:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 12:06:10 2024
Old-Return-Path: <prvs=8854759ac=Johannes.Thumshirn@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3995120657
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 11:49:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.509 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	TVD_SPACE_RATIO=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WLpyYo7CPDmU for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 11:49:30 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C9F2B20655
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1718106569; x=1749642569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=joufdrNO2/FLdgGzlnaieoHfZ28FYCwNXGhrZ08f24E=;
  b=fCeIvDFDy+D1LBbtYOvhQ703Hs93iEfmaSJaQsThBtrhB3MBdR96D+pY
   9S+r69c/ZCOFyK6SEyMZjPfFR57q8xWJWMxAEI6JpiE+zCZ3Q8mmvF8aj
   uMsQg1NIoJZ0PDosnOKw2vVww/SbSxy26olSo77szzxeJ+hVprFJRKn38
   2HRhFlkPKBh7TTz3eaXQKWJQtqob60r7fP5vBKFydw0zd4WzT5tuJwlhU
   jKlHYjJKh6s4GB/hTJAd2yfWRWZFK+vCFMJe0n0waly/wsLLwT+lIKDpD
   Ki+HnGazplusg2IHKn4e9V5QbRftfSKWaHEO+1AymwjVx8eBnvTDPfr1g
   w==;
X-CSE-ConnectionGUID: JrPDpdWfRG+ZqkmmTiOxOg==
X-CSE-MsgGUID: E3cjbR6US1mJc3gvMlH95g==
X-IronPort-AV: E=Sophos;i="6.08,229,1712592000"; 
   d="scan'208";a="18781832"
Received: from mail-mw2nam10lp2048.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.48])
  by ob1.hgst.iphmx.com with ESMTP; 11 Jun 2024 19:49:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRmGq6iSB90y4s8aNIFdy1KnNncJpFLUxVfTcv/yRxyNve+RltmXcIEvt1bSKHThU0VlPg28INa8JFeIncYLOuyorWyLraqrqYhY47AVMStS6ZTLCDwkMEjP6L+Yh6V51U04Q4Klft0CXv3xJNk9KWDjp7k/5jUlOH1jzctSHglGH9KsLVwzkAa1XRekLwtWywu/5nkkrWCp/FJ6z2CvjW63ZPFOUPwrzLmDsPHp8HlrGLhAcsuxOpL1BF83X/qmDVRhp3hnqj1UksYcbIADlUWBSzXIEQAynQOHBvd8tumoZlS9CNtm6EOqNQbcBQIc3+mA6UjNEiFzI+Q4WRkp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joufdrNO2/FLdgGzlnaieoHfZ28FYCwNXGhrZ08f24E=;
 b=iO5F3SwUN3X3j77HvgMjY6jG5O7gm7dZZrLDmD0WIOFQAxdRfIZ7BR8wEU9ZMv4qxZjdQcX3RgrKsJCQB5+h7FBo5Rvnzxh9yf/qPpCr5YaaKLndyFNj4h+fxJUnM1HmgMYzeut5iGT+BkoJmEiFET4CVOUNbTIbY1mACXiR3q88O5AVnDLouz7DGwaVjNsrDkBVAyD/80TfEsWxlq0bDJ/WMzaXVkibVOHG9JeCsGBPocarfWyz2IMj7vU2zcKVHi+5hB15gzYfYsZw2ioCshBWZOhEQaY21G8mUhGAF+eCX6MOfsqKJ33eacPbQldtHmTlG2v/gNRzVvspJxF0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joufdrNO2/FLdgGzlnaieoHfZ28FYCwNXGhrZ08f24E=;
 b=OVto4xmIBCZSfAUJmn/NJAVGklt21Os5hPTqNzTajqHqfyRNN/xQkPzIx0w4SrbcjO3PrBonbpVhNOJ+smxroDnUEuwHQyNRVuh8sJ6rhfRV1AdlkCaURdQyWxJ38Jr2v842hXjWVaNAOZs2wpsNceCT0GfYnZH6a+RyQfLDbDA=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by PH0PR04MB7688.namprd04.prod.outlook.com (2603:10b6:510:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 11:49:20 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::ee22:5d81:bfcf:7969]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::ee22:5d81:bfcf:7969%4]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 11:49:20 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Richard Weinberger
	<richard@nod.at>, Philipp Reisner <philipp.reisner@linbit.com>, Lars
 Ellenberg <lars.ellenberg@linbit.com>,
	=?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka
	<mpatocka@redhat.com>, Song Liu <song@kernel.org>, Yu Kuai
	<yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "linux-m68k@lists.linux-m68k.org"
	<linux-m68k@lists.linux-m68k.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "drbd-dev@lists.linbit.com"
	<drbd-dev@lists.linbit.com>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Subject: Re: [PATCH 08/26] virtio_blk: remove virtblk_update_cache_mode
Thread-Topic: [PATCH 08/26] virtio_blk: remove virtblk_update_cache_mode
Thread-Index: AQHau79kF7G5+NsLzE2Hf/a9e+yyI7HCc0sA
Date: Tue, 11 Jun 2024 11:49:20 +0000
Message-ID: <89d4138d-92b7-4899-a028-277dde4b662f@wdc.com>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-9-hch@lst.de>
In-Reply-To: <20240611051929.513387-9-hch@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|PH0PR04MB7688:EE_
x-ms-office365-filtering-correlation-id: 89a728e8-ce41-4765-5853-08dc8a0c87ff
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|376005|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?NWQ0OExuMTY3TGJVTzcxS0JUanpBVE9EYWRXNEI2K1BJTmV5a0dpQ0NncXpk?=
 =?utf-8?B?cE9WY3VHRnJtdU9BZzdKUjZGdHkvN2p4MWo3WVI1RUt6V0k4aXVXeng3WEln?=
 =?utf-8?B?QkRXRTYxSUovc2IybSthSUF3NlRMYmwwdTk1cWY4Vk1oc1UrWUlyT1NRRnQ2?=
 =?utf-8?B?ckpac2xud0VldFF1MWZUM3VmY0xWRURCNk9pNEtqZ0VseUF3ejJHUWhDUFFW?=
 =?utf-8?B?M09pbWF4blowenFHNHJSb3oxS2krTDc0eWM0Y2FEenFYOVROd3Y5SGg3Smpv?=
 =?utf-8?B?Q1Rib1FzSkIrdWkvUFg1ajJ5b2QwL3ZIUHlmNDY5QlhlUWhXcWtKRzIvOUdK?=
 =?utf-8?B?dmJMRWJxcVJjNHNYV000QmVBVVl1amFHL2d4SDN1ZnBxNXc1ejR6VjBZU2Ri?=
 =?utf-8?B?NDRVVDlJTFRRSkMvQm1sUGM3NmdQU0t6c0FvY2hENC9paE4yQnlyQWIzNlV1?=
 =?utf-8?B?MnNLQ0JGOFM1VWdwbThtUWJ5Q2orS2kvVDdqOGlxUGdmL2g3K3p1SytBcllq?=
 =?utf-8?B?M2hUeVBMaVZ5VFUxK1BtNTE5TnpDRVc1NHJSL0YvT0tsank0aDRXVG1SVkdL?=
 =?utf-8?B?eTJvcENsMUFvdTZVa24rTWtMRDc0Vlh4SCszRkd5RGxlU0pZMWF0RmZtYWgv?=
 =?utf-8?B?TjZzT21Oem51ci9TcCt1ckx1YURTVVlIOTh3SjRzem9FdTEwWVNSZCt0Y2NO?=
 =?utf-8?B?djhNbkQ0N3FTajEwUThXUzhiQTBnK0FPWklYRy9IamhCL0NXbDBaaksvVVdy?=
 =?utf-8?B?SC9IM3JrMDVsZm9wcjExSHhMUFNqeUpmcjhCNS9IN1pHVGRycVFlRWE4T29w?=
 =?utf-8?B?cXpEZGorNnZrLyszdEpZN1NnS1NweDRTKytCVWNOSjVSVFhscDMzSWZnbmNM?=
 =?utf-8?B?VE13Z3pvcXBraGZNRjBjWU9UYlFXYkRMaCthMmI0MitYbjA2VlI0UEdyUTFT?=
 =?utf-8?B?OVBTbW5qTDBpYlNmRCthbHpUaC8zUHVaL2ptNUZ2b0ZTR2VIYjkvSURxK29o?=
 =?utf-8?B?elkrSDhDRkx3ZC9rbm5qM1h3aEx2c2FqUWJVSEpYaUlxRVAxUFJrU0toWkps?=
 =?utf-8?B?RDBwdmFDcVhtZlFRaHZQNC9TL1RvbitBc3lLTzh6M2I1dVRYWUdkS1V6ZlBV?=
 =?utf-8?B?RmFJNkVUZHF4eFdRMjNUUkQxUnJJSzlzTFFQQ1E0M1RKWUpESzViWkZMaWNC?=
 =?utf-8?B?c1FHSUpTRTRsbXlUWWpRekhTUzBlcUk3dzNJY0xZbVNBcGVKWmdSZ1hpRVVs?=
 =?utf-8?B?WGs3djN3SDZpMmRKVnlJZ0xFdTFLUkNORlhxTlBLZ2dWK1lZdDc2eEN0QnBW?=
 =?utf-8?B?N0ttQUZReGpGZW9qTFE4MDZYTk12dGI1THg1alo0b0NJQkhiQ2xTd3ljc21B?=
 =?utf-8?B?aVNwVnRzTm9wQTM1ZjBKQ2ZXdXRNd0dWY0NYNkI3cFZnVkdEWHZIYWVJeExZ?=
 =?utf-8?B?UEVKODB2MDM5V2V4TVJtcnRxTXVoRDUzMThkZHhVTUtySUJ1blJjazk5Nmhx?=
 =?utf-8?B?cUhmcDAxQ1IvNW16RmlwQ2ZERFdIcXRGMHlQRW1PQXdMMngraE9KOVlxZi92?=
 =?utf-8?B?S0JaUXBYQnJtU1FtNkNaa2JCYjFwWXNXSU5uaE5vTGxDR3RnVGxnU0x0OEx2?=
 =?utf-8?B?RzlNcG1WWHRUVU9LWXd6S2FDMm1kQUd2WnhVK096TU56UXZteWZ6ZnFWNndL?=
 =?utf-8?B?bm5sVXk1dnkrT0loSjQ2RHp1bktzN3hyM0x0M0tHdzFXT090bW5sR3B0R1Fy?=
 =?utf-8?B?S0NEWVNiY0tNUUtvdFQ1L2FSMnIrL2R4U3RYMExRcHFQY1VsMFJpY1V0OThu?=
 =?utf-8?Q?fHqIqB2e0zMkLzeieOsvwqCrxfD1ZTx3fy5Pw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB7416.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHA5UVJ0K1JMZDFzVVBqQllHbHFJbWd6ZEpRSFJGQTVmRFlxbmhMYndCcm91?=
 =?utf-8?B?M3ZzcG1rV0llY3dpZlFtWWNBWm0wenJpNGpPbnR0NUdvMlF4RmxrTHZsWUZC?=
 =?utf-8?B?bGhhWThzQ1hIYTYzaGJjbHR2bVcyaU0wSU54OElwaDlQNk04Y1lXU2RHOFBi?=
 =?utf-8?B?dUwwdklCMHRPOGlmQnU2bkEzV0xFckdzRmVPL2hKZUJDVWFXVU16TkdUTTZI?=
 =?utf-8?B?ZkVWR3VraCtwdlNvbWZnTXVyNWFoWEFMWkcxUk40NmU3VGYxVDZxNDVtRklQ?=
 =?utf-8?B?TjN5K3Z1ZnFBNkREYnpFd2dobWNFTUpDb2VVOGFjM3NxcjRUekd2Sm96UVRP?=
 =?utf-8?B?QzZEN0FlU1R0d1Nub041OU8yNlNIcnJCQzM2ZTJ3dTVHWERBWU1TVEdVSlI5?=
 =?utf-8?B?dTVWN2tMdTJqZFNNKzZXMkdNaFhTRVJHUlFsY0h2YU4rVUNzUDFWdUpwQVFK?=
 =?utf-8?B?ZXdwVVpBSHQ4b2xPRmozR0xEdndZOGRBRjdacUFUU0lqZGtPelh3R3NRQmVh?=
 =?utf-8?B?TkJKbTdycTBEREFhbFdVaGRJQjVPOSt5UGh1QVNRVDFtT2hMeURIVWlXcnZk?=
 =?utf-8?B?UmVSNTFwK05ZNU9OZXZMSklrTUw5UmhMSE5QWlhHbDgrd08xemE0UENoR3JU?=
 =?utf-8?B?SmFQWEUzZmZIbm5UVStmYklKQmtaRDFzMUNLZmFLSFdtN2FuSlZMYmtmcHVv?=
 =?utf-8?B?SlAwL0NWZVpZZ1ViMDNTQjV0TWMxV2RRbXlzZzl2eWtabHJQV3h2aGJLUkRX?=
 =?utf-8?B?RElzbjQ2YXNISjk5K0VkNFRQdndoMnppMXlIQUpFVFdwT1g4TCt3dW1sOWZq?=
 =?utf-8?B?a0NsRVJXcjVSR21mUVpybTJQYzhtd3owbncxRGVPV2lYYjJpenpucFlVcTQ5?=
 =?utf-8?B?Yk8rUDZFODBXbmhuOS82RHpGWVN6dG1TaSs1ajd0Rk5wYzJpU2c3V2IrdWR0?=
 =?utf-8?B?RUhlUjFodTYyT0ZldjBaejhwU21aemZMT3JsL1p1VENWenhoUm1DRzFWMVJq?=
 =?utf-8?B?a2dGYXZKV2Y1VHh2L2RuY2NsVjMvN28zQTVRYXRlcy9hOXNqMW1aME5qLzgw?=
 =?utf-8?B?em5xZzFCekZZblZ2QWd0YWFhQ1cvbmVHZVlGbk9OSlFZdDlDYUZYUjNzVWtY?=
 =?utf-8?B?RjVGSVBOWGRaU1ZKQ1cyMkpTOVN5clM5ejRQTlJkYmljbCtrN0VRQm1SdWYv?=
 =?utf-8?B?bzMxbmZjZHZ2ZTNyajVwejZJcWo1RmhZclNzMjNTUTlhZVEyZGxVZW5RSmtp?=
 =?utf-8?B?ak5LVHQzTEYxSVYrTUppdWtMNHV0d2JScHcyT2N4RXQ0UXl1QVEzNGhBaXNK?=
 =?utf-8?B?UG9yV01iY1g2NlhyVE5aU1FpS08wUXBJTWJDOU1iLzZMNDhzdUVaS21PVlAy?=
 =?utf-8?B?YWR0QkVuSlRyamJFcm9BTGJYZWFjZm0wbklzMlRIUnlxTTRvT0FvYWYwazND?=
 =?utf-8?B?ZjRpZEg3VHFrTHRWWWlLZkVWSHFlT1RFeGpzU3RYQzl3eVF3UE56aWhwQ2d1?=
 =?utf-8?B?TXl2UmVoaVhVVTBKR2JnSDROUGUvUUFUait3WVhGakJDV1U5dGJXTFcxK21Z?=
 =?utf-8?B?dGhGWGszMXJhQ0k3VWo3bU04ZE80VkIzMWVHelVGR244RGlRZzUraHAxaDU4?=
 =?utf-8?B?am9oS2F1L09aUkFNMWtBbjF4NXM3dnYrZFlJK3J6NVBDSFNJbUhSM0RaeHo2?=
 =?utf-8?B?VjFva0RraDZEMlBrM0p1bjE3RGlnVEZjK1NBNUNjWmo5eEpZNnYrU2pMSC90?=
 =?utf-8?B?V21McGNXU2R3UWkwTjdiVXBPTXRaRjJLMmJTUUJ6a2tpQkw2N0J3MzFsb1Q4?=
 =?utf-8?B?VjV5R2lSbkFxSXpVZ3ZmdU8vbXVJRlBqaEpHWFRveUtQbVhrYzhDcjVyWWJF?=
 =?utf-8?B?dGh3MzZBdWlJZUEyQUhsNFY3ZDZvdWd3UXNaQmFPQjZTTk1Cb05qUElIWEJn?=
 =?utf-8?B?OHpqU0ozUXc0SzU5UlRqNXZVVUZuSVdqKy9qQ1RxZXdacGd6cVBBWFJoRjV3?=
 =?utf-8?B?aWJ2eEIxVXB1V3Q3eDZ6b20ydXI2RmZ6N1I3QVRyZDg1Qm81dE9JbVhyMEZv?=
 =?utf-8?B?OWkxcGtwNHBqT3R2L3RJMnE1MUpkU0d6YlFheHUvU2szdW1BQWg0azQrYkd4?=
 =?utf-8?B?QTQ4Yi9IczdobFdDUjdLdkxXSndueG9vcUUvU2Z4bWpJRkJzeWdTYTZmT2JZ?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <958B41E259453E438A1DB5FF9C75C781@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dQw6uzYdE/FnnfxnwjpkW3OgbullM0F/pcQuDv92l5TOph4sKR0fHczCbXxBw5zc/h60Jk6v/g3kf2aFVPiuMYLmWdD0uus26oDDOJnKvSHw1PpSaq1SUGVz9WMxpAbTLRrCBg58vEAS81mnY2M6ZdEKxT3tO0V75X+/r4mD7jv50QHA4T7278REL+/T5ypizLl6wveIKs6Hd+x5S2E4mRyXbI4zaV6X8Xn8uWAHW4jAN0XPGOPnO3ZzoPPrElb8IXZoCbsl97XQ0CeESxrs38qWCIcod6s4IxVQJzqwhjUcWHEMeW7+VrX/9G50f+AqmURZpsBXKQYlUfxe8Et4gh6VmGIBq07SRRlZNsbv8+bWjNvLgimrs1dLC2S73xbMhTos/fTubBOobNUt+fTThGB0KkMSVFOBg7QtJmjsSURPD64/mJdvZJ/OfJEhjL7v/KUMw0qvWDDlBOo7/rCOiqtXADNz03e7C8x2nDeKj81cMMuQHaXiQ5eouZNYjgYxFMfhTr3k3i9YLe6BNPjyoGuAnmmqKfxO0PzdFSP583TCIdW9/1NQFqb4BSKjTAxVZdKv/v7c8BeWp4wpV1/FgyDUGFmobj5x7AOPWeiIqLXmG8/FPKX+vxrn7nf6qOPE
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a728e8-ce41-4765-5853-08dc8a0c87ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 11:49:20.5036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abShtI8J+M5F2N3VJfAC6CnUQqnjNC8m27YeKFq1a1ey9sM9Qw5Nzs0SS0ktb01VOGcWcXfhjpCV/tqsv6p866q7FWxCaD+jL++RMAczM2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7688
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mtX4xXRpTvI.A.9q_.y2DamB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2966
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/89d4138d-92b7-4899-a028-277dde4b662f@wdc.com
Resent-Date: Tue, 11 Jun 2024 12:06:10 +0000 (UTC)

TG9va3MgZ29vZCwNClJldmlld2VkLWJ5OiBKb2hhbm5lcyBUaHVtc2hpcm4gPGpvaGFubmVzLnRo
dW1zaGlybkB3ZGMuY29tPg0K

