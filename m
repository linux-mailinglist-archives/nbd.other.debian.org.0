Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF63LY7jlGnBIgIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 17 Feb 2026 22:54:22 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731815130B
	for <lists+nbd@lfdr.de>; Tue, 17 Feb 2026 22:54:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 333E8205B4; Tue, 17 Feb 2026 21:54:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 17 21:54:22 2026
Old-Return-Path: <chaitanyak@nvidia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 521F920591
	for <lists-other-nbd@bendel.debian.org>; Tue, 17 Feb 2026 21:37:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.198 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nuwveIjYaj2i for <lists-other-nbd@bendel.debian.org>;
	Tue, 17 Feb 2026 21:37:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .nvidia. - helo: .ph0pr06cu001.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 67613 seconds by postgrey-1.36 at bendel; Tue, 17 Feb 2026 21:37:52 UTC
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B91252058B
	for <nbd@other.debian.org>; Tue, 17 Feb 2026 21:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKAVGC/SE8WOqwcveR7a5eRjLqWHAaD9Libbv6NB1x/9/cf30pkJP9SFNY1TpooNzG0hisH9UhKpi+FPJdpKeGa47So5/R6/DUzyYqBPpTXZmqGMeij/ITiP8aLiJNDbbNx0nN3yFOll2bzKJOUsC8MINuG80QwFB7K2vyUd11GQNNhiTnEV5DE1WF3jUJnZ7Atc+wn0FF+OrrDNnrglWPC4Et/HlNMkGM09oWrJiBAIy2pZmkMVTJNwENqe7Ojwoq5kLmHfzOQ0OZTCG/aG9tjPNF7lxnuQev0oPaq0JxLcLy60UOoqjSzELxJyJioEPdamBCnOeG6sX5hQ60a8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp4gqwkedDP+sLrdlCQQ8zWFuYkid+g6ZP5VX/1aWZM=;
 b=t8M1OrVDFfs+kYcYwRsoz49eakMiRgTUcIwcYrc9yEq1hlJeKxlUMIy4la6g/oGuWiByINveopa3rXnROZv6rGd7NV9x31ruc8rcgvPIQpRsaFv6xXyx1el/EewwgNl5oiUwPEeFg05bXNA9cXMqAusB7BXhZ0ID9mlvhVwM9MYvkU2SAggTR9l32WXWXh6yWpzCRfR30TFNU3pC9QYuW5FHgKdAECmdvacCR07kLUrs5ecQACWfrv0QIBKGCc+Vgdp4HaAbhW+woyMkdpnfmIWm8xKsXRrgwnsQ9K8Qvsc0fv7s+D8QN6dzzry89POyxTngLHiX/+OJVnvVDw+yAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp4gqwkedDP+sLrdlCQQ8zWFuYkid+g6ZP5VX/1aWZM=;
 b=QIBODF0uy3xA0C9l39czEW4+PsD+/3llh8vC2RgDP9i7zUxarnk2pOcuX6PcgBgfU/CX60pXnlSCvmHF6ihT8UdRpkhY1bBuu4OU9wJMUlljBz48qENFJPMSjkYR/1ED/cefBErEY7bL3pq5+oeZdzaPMzbmW6lW5OY9jhkInswxWfEFMv3/FoEPgD6Q3Z9X2IwM1UPsKzlBm5C4KdGYHYZGL8eF2iLBd4QIpdPdJQxmjHmvfHga6dy5AjarYB4qThCQa1Adaebk7Eg7lqW/N9sq0PU0qc8RScgCxwxx03Ji50ER4usbtj5+wXEznl3x+PlraUFYHVOWQeRblek8KQ==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by PH7PR12MB6635.namprd12.prod.outlook.com (2603:10b6:510:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 21:22:30 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::2109:679c:3b3e:b008]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::2109:679c:3b3e:b008%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 21:22:29 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Daniel Wagner <dwagner@suse.de>
CC: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.19 kernel
Thread-Topic: blktests failures with v6.19 kernel
Thread-Index: AQHcnL546UP/dHCUV0i3P4Kt4vejdLWAZHmAgAJRVICAAm4yAIACSY6A
Date: Tue, 17 Feb 2026 21:22:29 +0000
Message-ID: <a85b9d47-d52d-4ef5-8221-aef3e179925b@nvidia.com>
References: <aY7ZBfMjVIhe_wh3@shinmob>
 <6ad314f7-f3d2-495a-b1ef-a81a06498952@flourine.local>
 <f26001d6-062e-402b-8acd-46a737523e23@nvidia.com>
 <1a4f4064-8352-49c3-a7f5-3883c2c13025@flourine.local>
In-Reply-To: <1a4f4064-8352-49c3-a7f5-3883c2c13025@flourine.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|PH7PR12MB6635:EE_
x-ms-office365-filtering-correlation-id: d1eb82cd-ea3d-4d50-a95c-08de6e6aa80d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?LzhEeUVTSk1ZL1hYUW9TVHB1WnhDNHZ0T2xsNzdqQ0lEZkFlV3ZPS0lIdllY?=
 =?utf-8?B?R2ZobFVXaUFwU0gyclJxVGw2bkpaNFBJdCtHWis3eHgvbE5ULy84LzFzK1Qy?=
 =?utf-8?B?NUp3dGpSUlVjcGpON01hc1BxaFhHakJTMGdMVStqRVRRbUQzSm9BdkROMU9W?=
 =?utf-8?B?cHZEZGU5Wmd0SHhrUzU3aEpvMnhqREVCdE0wZUhnTVdkRytsUmxaTlUrT3B6?=
 =?utf-8?B?djJMNDFBUGVISk9yQWEyd2FTeGpaaW12NmxFTG1vL3BNQ3VWZ0plQmxwVHIr?=
 =?utf-8?B?YW1JZDZzcnA5b2tRbVdVYWh3ZXFsVGFQQWFqbE1UR3VpZWJRemY5UnFMQzRT?=
 =?utf-8?B?QzV5eFRHc2dDWEozeEUxZUtscWZVeHdWM2psSkNHb2x4TGcrN3RBRlpKbHc1?=
 =?utf-8?B?c3dZd3cvd0h1bU80L01OYXZiNUFzVnU5TjBFV0tPeVdwbG1EUGdCT2dyTWlk?=
 =?utf-8?B?RStxem1GVStQaHhHSVAyZkF6V0YwQndMeTlHOXhKdjZhYkxTc1l5dWhtQUh2?=
 =?utf-8?B?c0FOYWNSZTYzRDlTc2tPVVdMMnVDY0J1NVBGeVpQKzlOaDRnV0lqRVpNSTM5?=
 =?utf-8?B?cmx0SDVFcXV5REVLY1F5L0wwaXYxSnloR0Nxa0E3ZmIzVEgvUGxpbmRLMG1P?=
 =?utf-8?B?bmlDQTgrQ0Fib24yT0RGa1cweWdMNTZiVll3YUcwbThNSGlPWFZ1V1lFQ2l5?=
 =?utf-8?B?OFBUSGtCK2RMaURqTGtnTGdzSGZWNnpCR0xyKzNJZTJTYTF2aWFvcDRQdVhB?=
 =?utf-8?B?UkN6aUk1bHdsUXRlYU9SWHFscFY1eGQwb215R2t0MmdRaERsSGphOTREdmtI?=
 =?utf-8?B?aWVxd3JjNXozeTQ2czQ1V2lOczBwK0JrWEFYOFJkTXJVLzJRalVJQzB2cCt4?=
 =?utf-8?B?eXNEQUtXSWVoVVpDT21pVlBXckRhdEhreGo3RzhPS25FbStteEZxTC9sdVkx?=
 =?utf-8?B?WlZjK0xzZ3VuVmdZVnYrMHNyNGdFblgvOW16VmNqQmlzNGRtL0FZRWxMMUZn?=
 =?utf-8?B?OExQa0YyZFJQMndjL1NXZG5tM3FZcm9TaW5nOVFTdjlOWnJ1b3ZqZVlRa3ow?=
 =?utf-8?B?U0FzdzRHVGdOTGRxRlJDZHhyZXZmeE9OZm1WNzVxLzNkNWkvOXBHTnFpZTZC?=
 =?utf-8?B?OWcxaVFVamJXbG9pRC85cms1UEpSUmlqcGtEN2ZTNFR3ZnROVXh4bFEydjZQ?=
 =?utf-8?B?R3I5dm54a0xnZXhHdldzekFtamZVVi9EbFN2enh3N2krYm45eE9SeHJjREJt?=
 =?utf-8?B?c2xsMDFjdVVKVjl6UjIreUlhcFdmbFlzZ1lYUjF2dnpFVmthSmlmV1NMckRD?=
 =?utf-8?B?VE44Q3V6Nm9xbW5RVnJ1RHdJL3JvbEhsRGNDaHZVWjZjdThQemlxcVFkZUNy?=
 =?utf-8?B?cHhQVFQwOExBcWVoNmV5bWpLVmFZazIwUUJ4SzN3YzdMT0l5cFo3Ni9mWGVS?=
 =?utf-8?B?M2h1MUExQmthVWxUVWZuZEdUYkFPUVRQTys2SVQrMnFCYWtlUUM4a3lPY3Nq?=
 =?utf-8?B?TWxtTzJFdGJ4ZnpaRGlzRUFEamMzMkNabnNXSHUvNWk0TlU1QmFGNkZMUkk1?=
 =?utf-8?B?MHdwSHM4bENRZU5WQXMwQkU5WGZMYXNpSVdvSjllVGdLMnVNUXpaVi9UajhE?=
 =?utf-8?B?c3MvYVpTaWF0YUtYMm1meTQzSDlrcmF3WWxFVEsxRHNoWDBDR042TkpiVkoz?=
 =?utf-8?B?QmV3enI4L2tuNWxWZm9ORVB3cW9lUittUXovMDNCejZaTmlCVm5WUnR1cHZk?=
 =?utf-8?B?TDVrYUMvc0c2NWRka2d1cHpjVmdlRlVVKy9nSnlUdk80cmVraFVUbTREUkRQ?=
 =?utf-8?B?OU1TL3pSOTN6TVI4eWc0enl0OXQwUGh6OXhxUHp4VUpoeDJ4QUFCNVVrbDhO?=
 =?utf-8?B?cktHNzdSaC9vdjU1Q1dUTDFvWVpZZ0Q1WEVReTc4QURrcEF1V1FHMHR2TnYx?=
 =?utf-8?B?QjZjM1lDQ3psak1Nci9ycHdzOC9Zam5WWFAxTnlJamJXMkx5b1BobnhmNWJ6?=
 =?utf-8?B?UHRHUis1QWxxTTVVRTl0L3pZL2Y5ditjby9NY045d1NMaTNrYVNzWHR6c1pw?=
 =?utf-8?B?dlhySWljQzVhS2djVEhPV0h0SVh3eFgxYXdxaER4Qmp0Y3k4cm56UVZLSTZh?=
 =?utf-8?B?MStnSVZYdFRYY3AwMlVkYlI1eVhoUFJ4QVNwU09zKzhXZndxckVJbUF4RW5l?=
 =?utf-8?Q?yz9jotRcWGgYtJtWk/iZDdI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RitGUTJIRVB3YzREek45ZEN0cmx0WHVaaG9IVU8wVXhNMFBJOXlsV1lOZXVa?=
 =?utf-8?B?SlQ5eVZYUWNETTRQc1NuTzJsRzhPVUxNTTJ2S09rV1lHdGdlZUtGblJXYjZk?=
 =?utf-8?B?SkNrYWdxZ1BuVkd1YmJRcGovNXNnQzIxWHBERy9Xa0NMYWJSTUJBbUVCOC9V?=
 =?utf-8?B?THJOQ0NIQkxudG8rQkhBRlZKaEIvVXVQQndGTGlUbDlTQWN2YTJwK0U2WURW?=
 =?utf-8?B?bjhKSDdFMitjVDh3UG1BeUF2SzBjdmpLYXFHU0hDZDNXTE1aaDRLS1lnUGl0?=
 =?utf-8?B?OEJIZDZPWkdXZ2Z3ZXc4cnlhbDZwTVhONkJ6c0RBaDY3ak9LOWFhTkt5cXMr?=
 =?utf-8?B?bURNcjBxUEd6cDVMb0I0b3dmTkFFNVhvV1ZvQTU0WWpGaG9xalExWVVQZmJq?=
 =?utf-8?B?eHk5bHV5Y1V4R05QbGh6UldNT0QwcnZTZEFZSlhrR2FrY1Nudys2c3NsQTh1?=
 =?utf-8?B?bU9jQmpwSmxGZnlwOWtHbmw5RWpIdDBTN2VtN3drb0MzaUtvVWVZTGVWSWxp?=
 =?utf-8?B?cXJJSlJJbXc0UnFSWXN4K0JXVWJiMGxBODJVUnU0TDVGQkttK2FDa2hFb0ZP?=
 =?utf-8?B?eXNIRHNjdG4wVjFOTTVuKzRwVi9aeTdFVXJTd3dVTTByWDEvUVNncDlFdHI0?=
 =?utf-8?B?Rml2MXpSSXlWZUhMcldKbWRZOWc0K1pWL0tDU2ZCR2x4OHJRTjU1Vm8wVHU3?=
 =?utf-8?B?bWgxTy82cFlmQVNyOC9yaWNraUxYOFZVSnJBOThQNWdMbFN1R05tb3JvNktD?=
 =?utf-8?B?aVc2VVJBZXVsRDI1SFdwT0g4RkVCQ1IxNmRjRVRydEx0YWpkNlgvZjVvZ0V3?=
 =?utf-8?B?bXZkSmVoNVpMTHUyQmp5bk44ZUV4TVJDY1oyUGx6M0FaN1Z2L0VmRGcyQWVj?=
 =?utf-8?B?Vmw3MXIvMTd6eERJUGdYc2l4YnVYczdtSWNGZUk5ckV1RTRZcTUzbGlaU2R4?=
 =?utf-8?B?ckdqRVpGV0IwSW5nVXBxM1gwNlgyOWQyYkl5OUw4bTN4TmFySWtVeUZja2ZG?=
 =?utf-8?B?d1JodWhFVVhnVE8yczBqN2xUUERGTEtQejBIY3JCZlJiR0Evd1VZb2JHeW03?=
 =?utf-8?B?dDZaYXR5VHVuOEZmNXpTSzFBd0NEY1pMNEZTWmJYcHRHOHhtRm1YWDJVbnNr?=
 =?utf-8?B?NVpuNjRjSE1tWFdJRkF3UXZURERCM2VEbFlzUmtzS0F3amM0WTdaTlhSU1FD?=
 =?utf-8?B?eDA3dUhZNjhLeE52TCt5eDhQMWNRM2RXeVZtL3VRbFFTdGI1ZVU2NVpON2Jq?=
 =?utf-8?B?ckVyWFppcWR4MHJqK3FnK2UrQk9rSlowVzdXWXFqb3BGNjdiNitjaFdkUjhu?=
 =?utf-8?B?Sm9MVWVBempjd2p0cXJGZVBhU20vOEJBNW5iaHgxSjFNQ21Zdzlvb2ozZy9N?=
 =?utf-8?B?dnFicGlZb2ZtUjkya3BwWmZnaC91alVITysrVE1ab2NKVFdQS0tVV1dqUzli?=
 =?utf-8?B?UGRxbnhvS095RG0wRExWaGJFVnMrL2laaTY2Q3ZwcjQ0d3BwUWFUYjdRQ09D?=
 =?utf-8?B?S3BtczdUZ203MGZ5NFBpai95MTBJa0s5UFZHM25RaWhtRjlkdFRrZUF1WGo5?=
 =?utf-8?B?cGdKa3pYd2s0QmRuRG8rR25uSFZIb1l0UEozUzVldHZuRHFMeVdOeTZyVVY4?=
 =?utf-8?B?QzRYajIxMGZzY2ptM3pDeDdDWC9NNjBhQWFBQ2IzUktTay9IYnNjOVFLRlZH?=
 =?utf-8?B?TXZ1MTFkWFdzZDdCSW83Ujhva0pVSVZ4N2tsbHB1SmRhdXVIWDdUbFNiWTZq?=
 =?utf-8?B?cjY0U2ZMNitCcnhZRE1Za2RleXFJZkJDWnB4d0VFekhjL1dtNTVpWFl2cVBG?=
 =?utf-8?B?MVlGVHVBb21WVDdTNkhRQnpoV2pXTFpWSnNvK29LMWZad0FFZjdhaW1RUzVV?=
 =?utf-8?B?ejFFQjcrS3hyUm1SWlJmRloyTDJMNFE0aXVwRnNqc0dkd0R2NnA2QVlNZGdH?=
 =?utf-8?B?WWpFWDdPTktKZitYWW9WdkgyTndZbjllL2FjMHhEMWFlc2Q2OHdoQ250dDJt?=
 =?utf-8?B?NjZFbldRMlVNRXhnbENJZW5kNjllRzF5UUZMYVJnaVJwTWJBQnZpQ1I1RE5n?=
 =?utf-8?B?OSt3VlFTTEFFRUEza1c4bXBKWDRUYTFmd0lXNmxBR0x1ZlhqY3QxM2s3ems5?=
 =?utf-8?B?MGp4dzB1WWhLdFZFM0lNUm96U2x3RVRRamtGSFNCY09TVjRSV2JRNHM0Z0tr?=
 =?utf-8?B?WENmbkNwdDBQenk5OHJFZVBKZERXWHdoL0p6c1ZNVG1UekZ6anFIajEzbTBn?=
 =?utf-8?B?SzJCR0NHTEc3ZThxaktQTU1ySUkrTGc1YWNCbXByY1lnamtMVlFoY0VILzBr?=
 =?utf-8?B?VmF5ZmFJa1VETEgzaEpxMVVndURyaVpsY2Y4OU4xSVdKUytEYTY1bFF2WFBw?=
 =?utf-8?Q?tlVqD/APxxjeMeiS5mOVLkKESCMmPTjXb+CzC3S+HfYJd?=
x-ms-exchange-antispam-messagedata-1: 94BATcsOOYMerQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <03BC2A802ADB924AA4C5F0F2AC18F6C7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1eb82cd-ea3d-4d50-a95c-08de6e6aa80d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 21:22:29.7944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8at7aMlQF2SDQA9lP0EYVVnLfzchM1lxPl378pfDliiq8SZEG0+US8q8KTRg7QTVGvTNMQ91io++hUWqVGYXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6635
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Hk4tHYNOWHJ.A.uaM.NOOlpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3497
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a85b9d47-d52d-4ef5-8221-aef3e179925b@nvidia.com
Resent-Date: Tue, 17 Feb 2026 21:54:22 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[chaitanyak@nvidia.com,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dwagner@suse.de,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chaitanyak@nvidia.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,bendel.debian.org:helo,bendel.debian.org:rdns]
X-Rspamd-Queue-Id: 7731815130B
X-Rspamd-Action: no action

T24gMi8xNi8yNiAwMjoyNiwgRGFuaWVsIFdhZ25lciB3cm90ZToNCj4gSGkgQ2hhaXRhbnlhLA0K
Pg0KPiBPbiBTYXQsIEZlYiAxNCwgMjAyNiBhdCAwOToxOTo0N1BNICswMDAwLCBDaGFpdGFueWEg
S3Vsa2Fybmkgd3JvdGU6DQo+PiBPbiAyLzEzLzI2IDAxOjU2LCBEYW5pZWwgV2FnbmVyIHdyb3Rl
Og0KPj4+IG52bWV0X2ZjX3RhcmdldF9hc3NvY19mcmVlIHJ1bnMgaW4gdGhlIG52bWV0X3dxIGNv
bnRleHQgYW5kIGNhbGxzDQo+Pj4NCj4+PiAgICAgbnZtZXRfZmNfZGVsZXRlX3RhcmdldF9xdWV1
ZQ0KPj4+ICAgICAgIG52bWV0X2NxX3B1dA0KPj4+ICAgICAgICAgbnZtZXRfY3FfZGVzdHJveQ0K
Pj4+ICAgICAgICAgICBudm1ldF9jdHJsX3B1dA0KPj4+ICAgICAgICAgICAgbnZtZXRfY3RybF9m
cmVlDQo+Pj4gICAgICAgICAgICAgIGZsdXNoX3dvcmsoJmN0cmwtPmFzeW5jX2V2ZW50X3dvcmsp
Ow0KPj4+ICAgICAgICAgICAgICBjYW5jZWxfd29ya19zeW5jKCZjdHJsLT5mYXRhbF9lcnJfd29y
ayk7DQo+Pj4gICAgDQo+Pj4gVGhlIGFzeW5jX2V2ZW50X3dvcmsgY291bGQgYmUgcnVubmluZyBv
biBudm1ldF93cS4gU28gdGhpcyBkZWFkbG9jayBpcw0KPj4+IHJlYWwuIE5vIGlkZWEgaG93IHRv
IGZpeCBpdCB5ZXQuDQo+Pj4NCj4+IENhbiBmb2xsb3dpbmcgcGF0Y2ggYmUgdGhlIHBvdGVudGlh
bCBmaXggZm9yIGFib3ZlIGlzc3VlIGFzIHdlbGwgPw0KPj4gdG90YWxseSB1bnRlc3RlZCAuLi4N
Cj4gWWVzIHRoaXMgc2hvdWxkIHdvcmsuIEkgd2FzIG5vdCBzbyBoYXBweSBhZGRpbmcgYSB3b3Jr
cXVldWUgZm9yIHRoaXMgYnV0DQo+IGFmdGVyIGxvb2tpbmcgYXQgbnZtZSwgdGhpcyBzZWVtcyBh
Y2NlcHRhYmxlIGFwcHJvYWNoLiBUaG91Z2gsIEknZCBtYWtlDQo+IG52bWV0IGZvbGxvdyB0aGUg
bnZtZSBhbmQgaW5zdGVhZCBhZGRpbmcgYW4gQUVOIHdvcmtxdWV1ZSwgcmF0aGVyIGhhdmUgYQ0K
PiBudm1ldC1yZXNldC13cSBvciBudm1ldF9kZWxldGUtd3EuDQo+DQo+IFRoYW5rcywNCj4gRGFu
aWVsDQoNCg0KVGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcy4NCg0KVGhlIGFib3ZlIHBhdGNo
IGhhcyBhIGNsZWFudXAgYnVnLCBJJ3ZlIHNlbnQgYmV0dGVyIHBhdGNoLCBwbGVhc2UgaGF2ZSBh
IGxvb2sNCmhvcGVmdWxseSB3ZSBjYW4gZ2V0IHRoaXMgbWVyZ2VkIHRoaXMgd2Vlay4NCg0KLWNr
DQoNCg0K

