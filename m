Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN33ILpCp2kNgAAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 03 Mar 2026 21:21:14 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEAD1F6BD1
	for <lists+nbd@lfdr.de>; Tue, 03 Mar 2026 21:21:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8BD8A20613; Tue,  3 Mar 2026 20:21:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  3 20:21:13 2026
Old-Return-Path: <chaitanyak@nvidia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4BA0A205F5
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Mar 2026 20:03:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.127 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.236, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YRahkJ0AOHct for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Mar 2026 20:03:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .nvidia. - helo: .bn1pr04cu002.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 903 seconds by postgrey-1.36 at bendel; Tue, 03 Mar 2026 20:03:17 UTC
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 49630205E5
	for <nbd@other.debian.org>; Tue,  3 Mar 2026 20:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6JD0bNL//NDt228QFczMxghzWNDOz7zroL88T1TgSmAHpigfmvGz25/3Wwuau8ew4nku3fD5WZm85K2U4+tIBsdXMQJhp+mqEEzqZfPeNRhqTkQp6e6BKnuVNRx6zf3//VLVc8yFlCmS3suYANIaPt9AWRoZ8AKZevItWQw/mVzaEAzlVIv8UmxTeHmgKKkImAtTcAaVHxY8boDpJSLI67TlgIo1YVs1RqkInMSfh/PbH/caJkGgKoF+jc41rDRGJhg398nRETe2prRPCoMn/Xby5+3V9nskvV4WhPokQoGZ12qDX1cUdy7HaMgSWuilTCA8rnSoDAjVk0JSbzfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8c9zUjArykjHmgaQOexeFaQaPOvesJwfaZ7ms5uSMUI=;
 b=Sl7CuTn8P6/JgCXwI3Ao0c9j4/V40v3ByNZN1K3lgE7FNyj9wnOpSynJKV500WpXdvQ+pjmLAFHITHHY98tk+trZ7c/5PJGlDBl00+b+MNecJJdBDGjIBBUyeKP/q9FV/dJSnxl1kJ1368YKPcvGzeBL+hFYbPDDO52OC4TE7tdbxXQTIuQcHh6vvPdlfQKhOOUdIxDzX1W5jFrmaNcVvJUpLVQxgdgOmEK3T8c0pWJLqG2o0iWEuMzfdZ00qOfEYwnEmv7FZwLF0MbxbDd6cZ2NQ+Im8F8Yf4bBOx46vw5t7NSr9sqFcyZqp5Q+o4CvapKL7r9sHDteub529kRuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c9zUjArykjHmgaQOexeFaQaPOvesJwfaZ7ms5uSMUI=;
 b=PmSIu7oHgXhSrn3yA0lNDGIlYaMMbMIVoRSp0IGjm2HfdXmPCC/+ONXuUUCFFdNukZ94yTNu5zw/XeE9R8X60sYn0Ald7Lpd/WSX/sF8BO+JwkmMP1f0bgk/36fMt79gUrRAjsAeam1ItzA0yP168Ty95s2XtQKw1I2sPg9SDcjXDz6YAEsDItsT2aLxrDJtAusspbZ1HY5w/mauG3zsCuG/64TWyfijmvPbE5JTodOGNPtxzz8TnLYeDUXSWuw/GJIFGLFrxwqhjzXfon2bJ9dX2Z/WxA3NqWA7SyS/M5vHK8q/8KoSboxKUxnP32MDoMAOXnRy4I3S62yJRhoJ3Q==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 19:48:13 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::2109:679c:3b3e:b008]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::2109:679c:3b3e:b008%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 19:48:13 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: John Garry <john.g.garry@oracle.com>, Shinichiro Kawasaki
	<shinichiro.kawasaki@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v7.0-rc1 kernel
Thread-Topic: blktests failures with v7.0-rc1 kernel
Thread-Index: AQHcpvcwQ4wuN59YckSu4sxsMI434LWUs9WAgAiLk4A=
Date: Tue, 3 Mar 2026 19:48:13 +0000
Message-ID: <73ada395-a06d-4ac7-ae0e-dbbc1ebfb36e@nvidia.com>
References: <aZ_-cH8euZLySxdD@shinmob>
 <15ee757e-6140-4151-a1dd-cccb781c89a1@oracle.com>
In-Reply-To: <15ee757e-6140-4151-a1dd-cccb781c89a1@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|SJ0PR12MB7005:EE_
x-ms-office365-filtering-correlation-id: 3e3e53ca-93be-4a58-ea79-08de795dce76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 rDP4769r0UwlDF0FzieunMeLW+kc1ZPcO4aflCRGz+l/hgG6dDIr399IbB3+nUKq2Hpoz2IrJsB6i2gCZVnx5SZaQ8XdTurBo1zOvHmz9VIW6RxgenYlU11acE6961Rzy5V4bzLnqGwWXBlVyugVxQoUxmGVlcE4YNqLwlLyoB2nbp4LDkZEpbTvMCxYEsXaxMLtUzjS3hij/RJMoC+dfNgV3GmhXuV5UqzcXPhjAyE4RWy76CgY/n+n9AxP5dlc9MPAiqp+jxNaa6eSXat+ytKH9XQux5Rapcy/MSk7Zqg3S0h08NpCHuoaO8EeauEoc5rvHdLlipWe0okcVdIqxAjBRC+otYNb8PVqJKwnb9kLooquae7s1EaKS2B7bCc8cCzavBcDwloYAaOi1xLo+qZ0A7J9XLY8kZhB/RuWecM42OnQa+WpXYQ3WGiJz8+OHonwE/Bst1Dxgq4Ui6dHZ5C6+EksW4WMZE/uICC6brT7Y2gZeeXcHjwZ3zI8/Cx8aiEqX1e8By2NvygTZFo2IWRqzyqt7lgvtVKJEFpKgrUGPWnXLNseVnuQxCT9bKCfZkblGIcjVsW69manPBECDywAZCKifdvpIuPETVc9UaDuelkVDwFYUgMtoqRMlfgxTVIjm11Kp0316kct4MDf8bbMo4h22bb5RfAKkACSGCMbPi+zzeUXhWlVxbiJEBSX+QL8kqCIAT9g4b66BEUk1Ysi8cYoN15Hkulg3LuO1BglUGhY1YXpeMkyC/UCkHSyXCYeZtJ7vUHjJxmLufBuEgw58Pzs5uxAzyuhHzvJosI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDEyb0IwWnBFWDl5K3N5UldBSlBhS2wwajlvKzdYRTQ1TkE4di9nS29wc1B0?=
 =?utf-8?B?R1J6bEcreUIwVzBXMmFlZWhuTDlXd1h3MmZRZVVVMll1d2FHcHRVeXE3TUxm?=
 =?utf-8?B?bmRJM0VBUU5LYUY1Nm9pbW9rL3FrSFJmOVJCb2h6Tjk3YUp1L2FBcGMwWndu?=
 =?utf-8?B?eVJ2ZjBmTjRhQnRUcDFERFVYaUlJQk1XT092aDdFMXZEekxtNGZyZzZNTnZM?=
 =?utf-8?B?djJsbEZ2WGo3dXdjbnhDZjhqMkNwNkpsWG04Sm4rYVJPd1JPT3FSZHN1NXdu?=
 =?utf-8?B?Q2g5U0Q5TE5oc0Q1a2hvUUtPa0ptb1dCMFFQWk5HamJzbFFuZzBqa3ZjSFc2?=
 =?utf-8?B?ZDF5eCswWjJjYWppdFhrcURXSXlYbWp6MVhwZUs1alJDbWdvMTBiUVZwMFdN?=
 =?utf-8?B?UXhxSWZXb2tib2MvdmlSNjRnOWZVdjh4M3l5T3dmbTlLalRVL2o4eVg4ZEtO?=
 =?utf-8?B?d2VTKzYwWHBuZXVaSjRteWwzN2RDTTZ2RlBuTHNvYlppakt6ODFZRlBaRjNZ?=
 =?utf-8?B?cXVkVW11YXgySlFwM2NFcUNZYlF5ZXJWNmhWVDhtaWozUEVzZWxhNGRHM1My?=
 =?utf-8?B?bVlSaDA3QS81UHJiNkpiRnJaRHVTcTZKSUNGd2hEZ0dpUFNtclJqUXFYM1ph?=
 =?utf-8?B?eTdqenpNV09EWkJCcmhqM093aWEvSG9MSlBjL0tQcUZRYkVFTzdCc1FkcS91?=
 =?utf-8?B?NXNJOUczTnBNeVRtcVNqNmJFMTliVVpBb2JqRjZrMGdHRnIxS1FLTEd0OGJT?=
 =?utf-8?B?bEpLR1hraGwrYWM4TXhvbVZpZjFRM3VCQ2NXb1NxZTZIMEVqTVJRN2Ird3M4?=
 =?utf-8?B?V1djNGhPWVZGMEk2QnlFUnBYOEkzV1VSWjc5dmVrT1ZIYmJhVDNOVHQvTjF6?=
 =?utf-8?B?b3V5ZUQ3bG4zb2RPcCtuRFJjYnVqcWp0M0VJQzN0cFVpbWhVWGRITGhodXNi?=
 =?utf-8?B?eWVrTTI0bGcvZWlKd0JLcEQyUlZXaVJWSC9SY3ZZTkZmUmIxWFlLRlBndTVj?=
 =?utf-8?B?U1VCQUN6ZkxWbnJqUGpjRVliY0xSNWkyMGsrRERtd2RXeXduSmcwejBVall4?=
 =?utf-8?B?blZLbVhjTmFjeFpPNHA0Q3BmS3U2QnRPRFF0NGo2TU9aelpVUlFEREYvSWZj?=
 =?utf-8?B?UkxiMEJITGhaRUlIcFdkamZLR3paTERLWDhwQU5wcXRSczFidGQ4dEU5ZFZ0?=
 =?utf-8?B?WHJQa2tZQ3JHc09iN1NiTEJwUGxibmNHVU5LZWUrTjVUTVdiVE4wL0FSei9X?=
 =?utf-8?B?UWZxRW9vdmtrSEJDSlZTVG9WM0EvNTUyaUpGVmlsNmpnK0lUdXBoSnFVTnU2?=
 =?utf-8?B?WjdmbzJUaVlUWWtvb3EyUVk2amF5M2lFYzI0TlFVdG9NNk1iT0hQN29qQkRG?=
 =?utf-8?B?cEUyMWhvSkhTSDN0ekFCd2tMeHN1dE0rcGlodmZ5TnpHS08wUVBIWUJpV1l1?=
 =?utf-8?B?MHFxVENyd1k1QmVITURyemR1SWNVanN5dDRoL0o0cC9qK3FDK25ZM0Ezd0Nm?=
 =?utf-8?B?Sm1ZYm1FZml0aHUyc2pQbVNzbFRDaVlKN0ZTTUQrZlRhMlUvY0haOTFINkY4?=
 =?utf-8?B?dHl2c0NnYVp4K3N4dEFaZzc2YVBCWHBQN3N5OHo4MlNEb0xWMktRYXhXREF5?=
 =?utf-8?B?TkVFR3dxRUhLSEhJS09sWlVETGFNRGNjYk13cEZjdVA0ZlV5KytIdGFmY3Y5?=
 =?utf-8?B?U3NRWmI0bzBpQ0F0UHpGeTluclNoUWI1V0Z2cjA2a1F4UksvR3JuOEhWaXFx?=
 =?utf-8?B?TlFpa0lBY2xDdWw3SUE2b3d2N0N1S0diNk1CbW0rVkJqT3lLOWVEZm45b2RO?=
 =?utf-8?B?SkhzeWpjRWVPRG9qbktuMWpxZXhjZ0dUVTdaRC81d0FpaGpwY2NhWklrSnFJ?=
 =?utf-8?B?NGI3TUdISkwvdnc3QlhiaUdIUHNHU05KTENhTUpmZ2VTZ2UxZU5Xd3JobG1n?=
 =?utf-8?B?SlV1VmV5anJ1Ti81VXdHK2drK1lFNVB6aFJTNHdKRW0rNGlJN3kyQW1EVHJ1?=
 =?utf-8?B?Sk14d3VldG5QT2ovTUxFUHF0WUJGSDZZWDZ2c3V3VnFoejlZT0xvMlB3K1dv?=
 =?utf-8?B?eHBzUHIydHFzSDMzNXIvd2xCaDNZaG0wU1g3bW5LNkVnMXNTdmhrUlBUR1VN?=
 =?utf-8?B?cll6ckdQRmlpNTR2L1NvN1ZTRURRekVBV01aSjVIUHRyc21zYmlRcXU0VmY5?=
 =?utf-8?B?WlAvNG1GY1dHcDBLWlpZQzJWb20vYjY0ZW5ZelFkUWdqNDJUN1R1L1VJdHVV?=
 =?utf-8?B?bWpTaUVadEhJWWROQU9kV1g0aEFsRGNrV0tVV1BPZHRheHBtN3FYTE9LRHJq?=
 =?utf-8?B?MUhvdE4rd1p3YnA2bnRpV2FHYU5weGVmYlB5dWNGWEFvUjdGQXlUK1VNUnB3?=
 =?utf-8?Q?G0q03tT5pGfuBFXy6kbZlkUATh/hQHWbVnPprc437ayKW?=
x-ms-exchange-antispam-messagedata-1: CBeFICJRZTChSA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1E4274BCEAF74498C75313F1A28059D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3e53ca-93be-4a58-ea79-08de795dce76
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 19:48:13.5855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBAGNEiY/DO30smCq7TrNUfkqfD4bUP4szOzMkEBCj0eugzMxdqrJxSwce9HEYGsfXLe/mGxhX+r1+vuv2CjgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9PPyacTKbRO.A.StlM.5K0ppB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3508
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/73ada395-a06d-4ac7-ae0e-dbbc1ebfb36e@nvidia.com
Resent-Date: Tue,  3 Mar 2026 20:21:13 +0000 (UTC)
X-Rspamd-Queue-Id: 2AEAD1F6BD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.01 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.g.garry@oracle.com,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chaitanyak@nvidia.com,bounce-nbd=lists@other.debian.org];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chaitanyak@nvidia.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

T24gMi8yNi8yNiAwMToxOCwgSm9obiBHYXJyeSB3cm90ZToNCj4gSkZZSSwgSSBzYXcgdGhpcyBz
cGxhdCBmb3IgbnZtZS8wMzMgb24gbnZtZS03LjAgYnJhbmNoICo6DQo+DQo+IFvCoMKgIDE1LjUy
NTAyNV0gc3lzdGVtZC1qb3VybmFsZFszNDddOg0KPiAvdmFyL2xvZy9qb3VybmFsLzg5ZGYxODIy
OTE2NTRjYzBiMDUxMzI3ZGQ1YTU4MTM1L3VzZXItMTAwMC5qb3VybmFsOg0KPiBKb3VybmFsIGZp
bGUgdXNlcyBhIGRpZmZlcmVudCBzZXF1ZW5jZSBudW1iZXIgSUQsIHJvdGF0aW5nLg0KPiBbwqDC
oCAyMS4zMzkyODddIHJ1biBibGt0ZXN0cyBudm1lLzAzMyBhdCAyMDI2LTAyLTI2IDA4OjQ1OjIw
DQo+IFvCoMKgIDIxLjUyMjE2OF0gbnZtZXQ6IENyZWF0ZWQgbnZtIGNvbnRyb2xsZXIgMSBmb3Ig
c3Vic3lzdGVtDQo+IGJsa3Rlc3RzLXN1YnN5c3RlbS0xIGZvciBOUU4NCj4gbnFuLjIwMTQtMDgu
b3JnLm52bWV4cHJlc3M6dXVpZDowZjAxZmI0Mi05ZjdmLTQ4NTYtYjBiMy01MWU2MGI4ZGUzNDku
DQo+IFvCoMKgIDIxLjUyNzMzMl0gDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiBbwqDCoCAyMS41Mjc0MDhdIEJV
RzogS0FTQU46IHNsYWItb3V0LW9mLWJvdW5kcyBpbg0KPiBudm1ldF9wYXNzdGhydV9leGVjdXRl
X2NtZF93b3JrKzB4Zjk0LzB4MWE4MCBbbnZtZXRdDQo+IFvCoMKgIDIxLjUyNzQ5NF0gUmVhZCBv
ZiBzaXplIDI1NiBhdCBhZGRyIGZmZmY4ODgxMDBiZTJiYzAgYnkgdGFzaw0KPiBrd29ya2VyL3Ux
NzoyLzUwDQo+DQo+IFvCoMKgIDIxLjUyNzU4MF0gQ1BVOiAwIFVJRDogMCBQSUQ6IDUwIENvbW06
IGt3b3JrZXIvdTE3OjIgTm90IHRhaW50ZWQNCj4gNi4xOS4wLXJjMy0wMDA4MC1nNmM3MTcyYzE0
ZTkyICMzNyBQUkVFTVBUKHZvbHVudGFyeSkNCj4gW8KgwqAgMjEuNTI3NTg5XSBIYXJkd2FyZSBu
YW1lOiBRRU1VIFN0YW5kYXJkIFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwNCj4gQklPUyAxLjE2LjMt
ZGViaWFuLTEuMTYuMy0yIDA0LzAxLzIwMTQNCj4gW8KgwqAgMjEuNTI3NTk0XSBXb3JrcXVldWU6
IG52bWV0LXdxIG52bWV0X3Bhc3N0aHJ1X2V4ZWN1dGVfY21kX3dvcmsgDQo+IFtudm1ldF0NCj4g
W8KgwqAgMjEuNTI3NjM2XSBDYWxsIFRyYWNlOg0KPiBbwqDCoCAyMS41Mjc2MzldwqAgPFRBU0s+
DQo+IFvCoMKgIDIxLjUyNzY0M13CoCBkdW1wX3N0YWNrX2x2bCsweDkxLzB4ZjANCj4gW8KgwqAg
MjEuNTI3Njk1XcKgIHByaW50X3JlcG9ydCsweGQxLzB4NjYwDQo+IFvCoMKgIDIxLjUyNzcxMF3C
oCA/IF9fdmlydF9hZGRyX3ZhbGlkKzB4MjNhLzB4NDQwDQo+IFvCoMKgIDIxLjUyNzcyMV3CoCA/
IGthc2FuX2NvbXBsZXRlX21vZGVfcmVwb3J0X2luZm8rMHgyNi8weDIwMA0KPiBbwqDCoCAyMS41
Mjc3MzNdwqAga2FzYW5fcmVwb3J0KzB4ZjMvMHgxMzANCj4gW8KgwqAgMjEuNTI3NzM5XcKgID8g
bnZtZXRfcGFzc3RocnVfZXhlY3V0ZV9jbWRfd29yaysweGY5NC8weDFhODAgW252bWV0XQ0KPiBb
wqDCoCAyMS41Mjc3NzZdwqAgPyBudm1ldF9wYXNzdGhydV9leGVjdXRlX2NtZF93b3JrKzB4Zjk0
LzB4MWE4MCBbbnZtZXRdDQo+IFvCoMKgIDIxLjUyNzgxNl3CoCBrYXNhbl9jaGVja19yYW5nZSsw
eDExYy8weDIwMA0KPiBbwqDCoCAyMS41Mjc4MjRdwqAgX19hc2FuX21lbWNweSsweDIzLzB4ODAN
Cj4gW8KgwqAgMjEuNTI3ODM0XcKgIG52bWV0X3Bhc3N0aHJ1X2V4ZWN1dGVfY21kX3dvcmsrMHhm
OTQvMHgxYTgwIFtudm1ldF0gDQoNCkkndmUgbm90IHNlZW4gdGhpcywgY2FuIHlvdSB0cnkgZm9s
bG93aW5nLCBmcm9tIHF1aWNrIGxvb2sgaXQNCmZyb20gY29weWluZyBzdWJzbnFuIGFkbWluLWNt
ZC5jIHVzZXMgc3Ryc2NweSgpIGFuZCBwYXNzaHJ1LWNtZC5jIHVzZXMNCm1lbWNweSA6LQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL3RhcmdldC9wYXNzdGhydS5jIGIvZHJpdmVycy9udm1l
L3RhcmdldC9wYXNzdGhydS5jDQppbmRleCA5NjY0OGVjMmZhZGIuLjY3YzQyM2E4YjA1MiAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvbnZtZS90YXJnZXQvcGFzc3RocnUuYw0KKysrIGIvZHJpdmVycy9u
dm1lL3RhcmdldC9wYXNzdGhydS5jDQpAQCAtMTUwLDcgKzE1MCw3IEBAIHN0YXRpYyB1MTYgbnZt
ZXRfcGFzc3RocnVfb3ZlcnJpZGVfaWRfY3RybChzdHJ1Y3QgbnZtZXRfcmVxICpyZXEpDQogIAkg
KiBjb2RlIHBhdGggd2l0aCBkdXBsaWNhdGUgY3RybCBzdWJzeXNucW4uIEluIG9yZGVyIHRvIHBy
ZXZlbnQgdGhhdCB3ZQ0KICAJICogbWFzayB0aGUgcGFzc3RocnUtY3RybCBzdWJzeXNucW4gd2l0
aCB0aGUgdGFyZ2V0IGN0cmwgc3Vic3lzbnFuLg0KICAJICovDQotCW1lbWNweShpZC0+c3VibnFu
LCBjdHJsLT5zdWJzeXMtPnN1YnN5c25xbiwgc2l6ZW9mKGlkLT5zdWJucW4pKTsNCisJc3Ryc2Nw
eShpZC0+c3VibnFuLCBjdHJsLT5zdWJzeXMtPnN1YnN5c25xbiwgc2l6ZW9mKGlkLT5zdWJucW4p
KTsNCiAgDQogIAkvKiB1c2UgZmFicmljIGlkLWN0cmwgdmFsdWVzICovDQogIAlpZC0+aW9jY3N6
ID0gY3B1X3RvX2xlMzIoKHNpemVvZihzdHJ1Y3QgbnZtZV9jb21tYW5kKSArDQoNCi1jaw0KDQoN
Cg==

