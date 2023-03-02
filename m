Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB46A8A1A
	for <lists+nbd@lfdr.de>; Thu,  2 Mar 2023 21:21:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8C340208B0; Thu,  2 Mar 2023 20:21:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  2 20:21:12 2023
Old-Return-Path: <chaitanyak@nvidia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,THREADTOPIC autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CD62E208A3
	for <lists-other-nbd@bendel.debian.org>; Thu,  2 Mar 2023 20:03:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.272 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.09,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4z2scn56OxLv for <lists-other-nbd@bendel.debian.org>;
	Thu,  2 Mar 2023 20:03:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .nvidia. - helo: .nam04-dm6-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 5630 seconds by postgrey-1.36 at bendel; Thu, 02 Mar 2023 20:03:29 UTC
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0CB26208A1
	for <nbd@other.debian.org>; Thu,  2 Mar 2023 20:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVHOPBZS2wC11B8jn10tJ+OLeSOvvhjrnHaf9j9KBU8OgBW7HiyTcRB5G2epYX/LdECHdCXur4EexWXedSAwKdlcNzR6R9MVw6WaRGEwVJ30kM50rohbSfFmZ8Dpr2vg2387tVlPK68HpGaPwHN8ywRHWB+zmLh4RRCJ2EnL99ShV6ILBhCVLiG7qIDqJ00nyS4kJG7BqViuhEOOMwFgBXARlREQcEbjOqjEvfpKLVSV1Nq+c2GS+A7LfhryVBNDGGUQMVpxsMiVPTObtsraRD2Ek90LCnyHWQapmMl0cd6Zv+kLJIIDZBGQo5VZTjwCUygN+9YVeYAtjmqzQN0UEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT0aXd6SNJ+TlG4x/UcCyyc5IMlcmfJ2h+RKlDjJpY4=;
 b=Yrc0BMWJQrhONLvv0W+wu/knwARPPBGvkKszzksI2kOtVGBcLZX9bgdz3XClSPV2jEtL7ncTKSxGWKFclL9lWl6xxTIZH0nBEIMYuf9mlUuz/DXHANnl0loQA0MWFZbryj37A/pguO41emtCOR4z6fVoB1QAlZbGGnNaUOODa6Y5KvjTgG7kW/9aHocMVdD1yT2QlRWTAhog6pSyaoqkhNr2iqtTFSRTzaGF1SmW0uQ5VneS8ZAkHY2x7CpBUIpAlSpY5zJoRgjhnE2MiXGWB7La7DL8tSwS//jq1Q18AYqBpv/kwG+IB+z6teY3F5InTXltyBSKYuiHwczCgZmrjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT0aXd6SNJ+TlG4x/UcCyyc5IMlcmfJ2h+RKlDjJpY4=;
 b=PZoZPltKrPmYgF2gizgXFNmTXQDLwPwZyugmC0nTQlS0Oq99ZfTgz6ZPH8Tpl/T3ce2+EAOYIY7CTJ9BmB8wJirdqVohQiSqLVBCRud3mfw1wANSORBnrjd4VwU7/DpGaQLZnki55mciKryrb64cwe6sCR35YpwXj7TyBdTRGF/Rt4YIyFAQTVIZj6Bm7tiTuwvoHgrowjFXZxX9N8Pwafqs9YomTV7kaaRplzzk4GOSL1tSbrh90DihgHkxuXFkZ758qNjGKvo7dNZDGg0Waw1hu50zTNtKvqKcdZI5bXAD2ur2LIR2Yz8aCXDh5al9KGKS+QPsmXSRuXojbeqRSQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 18:29:32 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::4aaa:495:78b4:1d7c]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::4aaa:495:78b4:1d7c%3]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 18:29:32 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Jakub Kicinski <kuba@kernel.org>, "josef@toxicpanda.com"
	<josef@toxicpanda.com>, "axboe@kernel.dk" <axboe@kernel.dk>
CC: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>
Subject: Re: [PATCH -next 1/2] nbd: allow genl access outside init_net
Thread-Topic: [PATCH -next 1/2] nbd: allow genl access outside init_net
Thread-Index: AQHZR/WSjhFHimDwwEqyAqCR7Ot4aa7n2fEA
Date: Thu, 2 Mar 2023 18:29:32 +0000
Message-ID: <929c68a3-4e3a-03b6-4723-6515d28aefe9@nvidia.com>
References: <20230224021301.1630703-1-kuba@kernel.org>
In-Reply-To: <20230224021301.1630703-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW2PR12MB4667:EE_|PH8PR12MB8605:EE_
x-ms-office365-filtering-correlation-id: c9e034eb-dc88-4bbb-eaba-08db1b4c1148
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mXzPAoTDIztk4PGx7iIeYNijROWxtfgtbJy4j88Z0Jv3CP0lCvtkn+c7mQ2BNkJHPsVvZL7pY4qcry8Pa599WO5SxlcQi751EwsahGCGHk5RteUzt6m4yWBLaI34jnWfJktXhz61BN8cOBzxCWk1dGRxLbAVCLqOnfZupNsHfgImGpyX7pqZhEgPNxSi6n5V1y2QXgnZx1PxE4VpSMU24tpvvcJvzu1iLgJ0lbJgD73D7b2zo0B5Emq6XvtsbMyB8k3I34hflKaeEtAoocFGqIgsxTqsa+iUk+d8nhtk/MJ04MMVNySFxyKZxpJmjged95QhQdjAsRcOAFpumHxJ6Rf5FrPrY4kgJjZiv77+Dm3yZn7nPZcQ8eeJ76ICAsReqc49Gfxlkhqp8ypS7X71SNxf8M9MlgA5oonSAu6X/JyotliC2RiQlI4Y48KbGYer/diHxOL7nFN4yys1wGy4oaT1bbeuZ40aqXztlRFhjlZ//rM6BjUUInwB4V0a15j2n6cZZSuoA+PaCdgX/N7afQIfXfvVGjS0zrl4QbueHHP3Nl2GQk2eQWzl0aQ6G6dxGTp3CGxcRX9+YaUhJ7E/9Ejo9X2NMkPhjDA7BGtbCfD4IQ0E2yjCJO3iyE9l/aLPyIRbRPbnoR59hEU9Ds5FPMMfhMBFttw4UhD/+bxUQd6VlrvxKtH5oeAJI693L37W8zi9yqjyi5fVFeCwrqVynIUFZD1mWza9lRvUr/+5YGqHyaM9d6yF6ur/eg02Kjmu61QF7+51dIoNQl0Ey+EvHQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB4667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199018)(31686004)(83380400001)(71200400001)(36756003)(38100700002)(122000001)(5660300002)(8936002)(478600001)(86362001)(66946007)(31696002)(558084003)(38070700005)(2616005)(26005)(6486002)(6512007)(6506007)(53546011)(66446008)(76116006)(66476007)(186003)(64756008)(66556008)(2906002)(8676002)(91956017)(41300700001)(4326008)(316002)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bm96czl2ekx2RlhTQzNFdnBEN3ZYZU5sT3N6Rll0c3RKRmRoQnB2cFNRNFly?=
 =?utf-8?B?OFUxd3VlYmpWY0hUbmFVQjk1NldPeTBzbG8zekdiaHBwejU0ejJSM0JRN2xn?=
 =?utf-8?B?RDBYRENNTmFiVXNrSU5qdnJTdFRacVlmb042aFU0aTMvUHdUcUNXVmMrcm9G?=
 =?utf-8?B?dWwzQ0pDWi90Q1R2TGkyd2d6dWdOeU1nbG1nL0xEN2VzSWtJU2hnc2FTMndB?=
 =?utf-8?B?SklHOGd1L0hpb2xCMmdvaytRZ1l6NklETmJ2L1Y4clduQ3VWbG5aN1JINzQ5?=
 =?utf-8?B?TEE3MFpoWTNZWUZ4UVNsei9tT245bjFCOW41dXVwWHNOcVowNHlHQWliT25J?=
 =?utf-8?B?aVFPUnRWQ0RSN1crRkhzU3hGVkE4VFhEN3RSc21GK1VFdDA3dlZLaTMxMUw1?=
 =?utf-8?B?MnRKWW90dVVLd2RjOWFEM1l4amxaTUN0OUtreVhpZDBJb0N4dmFZdGZUZTha?=
 =?utf-8?B?aUwrRDVQSTJoWVp0Q0RCZTgyWWpzMjhhcXdzajhzNGhHYVlib0tvVzhzclpJ?=
 =?utf-8?B?VlZrL1NQQnFpeElEdmE1dUNiOTNNMTNuWkFTdjUwbHdKWm9WQXoxaTRCSVps?=
 =?utf-8?B?eUczRXo5anpvVXNtT1k5cW5NU3FYcVNGeU5zTStnZE1WTzYwazRUNTlIRWhR?=
 =?utf-8?B?Rm5IRzZEaDFZWG5pZUJ6NlRGc1Zic1BUWklLQnNsN1RGNVljbm5PTjc3Z2NO?=
 =?utf-8?B?QWhTNElIQlAyU01hL3dUTUJROVhTYWxpM3JXNWFQS0x5K2dLR3FkTEQxSFFM?=
 =?utf-8?B?M1cxVGhDMWFiYWlvR25XVXBDbWRRdjVRd0M2bk9pUzFmUWxxbjRaWDh5MkJS?=
 =?utf-8?B?dlRqbGMrem01YWZVU0wwdE1ldjhPUlI4eEZWdDloaDlaSWQzRFFLYlV3dVc5?=
 =?utf-8?B?U1FWUmpGUk13YTlkbldCTUlmbEllOGh2TFFKMFRkODZXbm9DanZ0bEY5WUg2?=
 =?utf-8?B?VzdNRW1NN295RnBRbTVUZ0lIbHVTNVcwdWNIeDR2U3lJUDFDQlpnZTUvT2hJ?=
 =?utf-8?B?eDlvSVNCVmgzVVBKdWNqb0ZiQmFRRVpZVXFyenpNNnVGSGdJWlk1dkNxcExm?=
 =?utf-8?B?dXFRUitMN0xLYnloaUlLbFJyaWQzcEk1MWJ2UFJONHh6dEhUeis2a3QycU9i?=
 =?utf-8?B?Vkw4YlZFK1d1TEtOd3UzNzJSYWIra3B5QTNWdi94eEZ4aVhReDkxOXROMjVo?=
 =?utf-8?B?SWRBOGgzdmRJTmNMTjMyVEtMWlhuSnlhR2lKb2c0c3B4SVl6RzZSWWZ2WExk?=
 =?utf-8?B?N2R5SU8xUEVHeTd1UDFLbHU5VFE4M3M1S3ZkZTJob0dja3FDWUxpeXhNSTZE?=
 =?utf-8?B?Y1VXZFFWQzhVV1lieTJwUTRaMS9FZXRXRmlWR3JobXRydFpMQUtIK1lPQzJ0?=
 =?utf-8?B?OHZSbkZ5MXM0T21lN21ZQytjWjNsNDAzd1VwdTZDTmxQYXdwQlJHMHYwNFRD?=
 =?utf-8?B?akdLbmpuZjBIU0ErTFFPQk8vQjZVTXljbkt4VmpkYisrL0paWHhFSXEzUytk?=
 =?utf-8?B?VllldFIyU1BhTXdkb0lPUGVyVmY1TlZKWjBIRFlQckcxdytGVG9ZQkEzdWFm?=
 =?utf-8?B?a0RKWjF3VzR4SEphb2VRKzgzTmRPSUNIbVdrUlVDRHdHNTBFTGZhcHhkSUs4?=
 =?utf-8?B?VkpWZ2JRWUI3SG9HNEU0a2xnNnlibWhIRndyc3N0OCszelo3V0p6ak5TTzgy?=
 =?utf-8?B?T0F2aDRISlA2Qk01emZUZVAxZVRURkE4ekd2MTFWTXVuaHBWUGdaeTV1cC9F?=
 =?utf-8?B?NU0veDhrMDdUK1RIOHNPMTJpRW5CQXB5VFRDTzRhYlRocGRlN3VzMmsraGJT?=
 =?utf-8?B?eTc5ckZNdjFwcThYM014YTExMUVJU0QyVlo1QVR5ZFJyVVBzc0NxSFVaakpZ?=
 =?utf-8?B?c25USExBMHRUelJTajJsVW9DRWl6Uzd2UEE1cVBEUWtwTEJyeEY1YVpwNjRW?=
 =?utf-8?B?ckkrYXJBekYvRWU5ZTZjRGdNeDBSak0yYVFtc0d3ZG8xZGtYWmVEVG5GR0Jt?=
 =?utf-8?B?NU9ueGcxUUNDbDNnc1pldkxGRDY0bU1IUDRlK05WbWI2NXNpcWxzMHZnUXNL?=
 =?utf-8?B?N0IvUlhMeXdIUUhib3F4VHZ0TUZMZWpjckVKell0V1Z4VE9PcnVOa0JBb1Fm?=
 =?utf-8?Q?WAe3vYK7Nx1ap7xNMvrd6Sa08?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21EA1E589E35384C833801D25016A8BB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e034eb-dc88-4bbb-eaba-08db1b4c1148
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 18:29:32.4356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chPC8ZavNeldggw6baudVTRlJP7WxWZs5rWHvOkTaDEABCVsnvYp0loZUGw3sBln470ZzFMoDgdV9qOE+OPvFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CR52ru4uhaE.A.f1D.4UQAkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2337
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/929c68a3-4e3a-03b6-4723-6515d28aefe9@nvidia.com
Resent-Date: Thu,  2 Mar 2023 20:21:12 +0000 (UTC)

T24gMi8yMy8yMyAxODoxMywgSmFrdWIgS2ljaW5za2kgd3JvdGU6DQo+IE5CRCBkb2Vzbid0IGhh
dmUgbXVjaCB0byBkbyB3aXRoIG5ldHdvcmtpbmcsIGFsbG93IHVzZXJzIG91dHNpZGUNCj4gaW5p
dF9uZXQgdG8gYWNjZXNzIHRoZSBmYW1pbHkuDQo+IA0KPiBSZXZpZXdlZC1ieTogSm9zZWYgQmFj
aWsgPGpvc2VmQHRveGljcGFuZGEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWt1YiBLaWNpbnNr
aSA8a3ViYUBrZXJuZWwub3JnPg0KPiAtLS0NCg0KDQpMb29rcyBnb29kLg0KDQpSZXZpZXdlZC1i
eTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlhLmNvbT4NCg0KLWNrDQoNCg0KDQo=

