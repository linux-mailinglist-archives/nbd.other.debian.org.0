Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E112A931
	for <lists+nbd@lfdr.de>; Wed, 25 Dec 2019 23:12:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 55D00202AC; Wed, 25 Dec 2019 22:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Dec 25 22:12:09 2019
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,THREADTOPIC autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 11BC520255
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Dec 2019 21:55:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.42 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6uFLyYEVchYn for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Dec 2019 21:55:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur02-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 7200 seconds by postgrey-1.36 at bendel; Wed, 25 Dec 2019 21:55:30 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0718.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe05::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8E98C2024F
	for <nbd@other.debian.org>; Wed, 25 Dec 2019 21:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WglRPLSewf0zNPIC9Kt8y/RCUPatBX0ri9Vb0yKSbna4Hpjsj+RgGqKGpQ/a0K3wn2zTF2uwMMOonxvq1pGH4APZoSgDbftaP4FsmHYVnBYmRMp/DxHAHvmZ56aQ3SG6myJYrojCB0QmW4BuOV+LKw+MZ/GZgS8AUJ0vUt1OVgBss5VV9uZDK5C5ttgxzv5rKnE+aN1JXnAitjL2NUwyvFWp24AGty5HEGTJr5KdBPEB6n8LAckdoVpfwYfujoO5EKvH9RrpImo0UlnWmO5afSQELP+ajk/IjSO5ncwBrFzczSE1Zs8nNG6ds2HsSdWMbHNBGlAm1MsLa/bt46ST0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULABRjepQdw4BzFcNWpLpiGi1b+LDYGte9M+Vh/a9To=;
 b=mrJ0TIQiyiUNQrQsDsPc59ZWRP2qVtlasMCCVhgEsmXAgLF8p7w73GKD/nhSzssQYbxIpr+S/ejj8LUY3MqxAoafad0CPMn+mU8D+zfLsxCrv3d+cKC1tcb6ygzZQxpx0X3UWoZM9iLjnN5ekkGzHxFa5f6y/AFV3dzL+Ou1CZQMmluGW9oiXtuE1qPMFfdzuwofdhmFHc4yGbNdZgW8B9DXnxIm7QpeWd1kH+GSioYYCpcG7w488z4+nKalNrMlK9Bkw0jIa4+IM/jeLEpf5QlENaC80MerGN7KI+yX5C9xo/EgCgfjfC5EGBrP3DH5+IGYf4a+Aw1RNmxM9K6qYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULABRjepQdw4BzFcNWpLpiGi1b+LDYGte9M+Vh/a9To=;
 b=pj+RZUFBt93ulVGmX/W5WJ4pPffgJahXBO6Vv0mbbj0Cvr8hhVUE6LBx+BMR2CrLEe/OaYrRaUOjR3PeXkgZmxBZjZO1a+Oey1cEgBOfoFQgWUgeIapLKOA5TxQs/osi6RxG7P50dAN6AINDcXtchlPEjubu40nU66JZY26lahU=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3461.eurprd08.prod.outlook.com (20.177.113.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 25 Dec 2019 16:23:13 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2581.007; Wed, 25 Dec 2019
 16:23:13 +0000
Received: from [172.16.24.200] (185.231.240.5) by HE1PR09CA0062.eurprd09.prod.outlook.com (2603:10a6:7:3c::30) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Wed, 25 Dec 2019 16:23:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "nbd@other.debian.org"
	<nbd@other.debian.org>
CC: Denis Lunev <den@virtuozzo.com>
Subject: Re: [PATCH v4] doc: Add alternate trim/zero limits
Thread-Topic: [PATCH v4] doc: Add alternate trim/zero limits
Thread-Index: AQHT4ZKN4cceTYqGGkyH+93888tYpaUNBu4AgAAFOICCFnNWAICrPJAA
Date: Wed, 25 Dec 2019 16:23:13 +0000
Message-ID: <08f2380d-10c6-ef3c-4361-2c484cd90c81@virtuozzo.com>
References: <20180501212242.986796-1-eblake@redhat.com>
 <bbf265a8-3380-e153-1fa3-3a7c9048692a@virtuozzo.com>
 <272b17ce-9247-e751-b85f-9eda492c3853@redhat.com>
 <5de902a3-bbe3-4415-8238-57d0f8e75371@virtuozzo.com>
In-Reply-To: <5de902a3-bbe3-4415-8238-57d0f8e75371@virtuozzo.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR09CA0062.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::30) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191225192310317
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 401b5c80-f5e8-456a-9293-08d78956bd11
x-ms-traffictypediagnostic: AM6PR08MB3461:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM6PR08MB3461F9A472E7055E2DE077CBC1280@AM6PR08MB3461.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(346002)(136003)(376002)(39840400004)(366004)(396003)(51444003)(52314003)(189003)(199004)(2616005)(956004)(4326008)(81156014)(6486002)(107886003)(31686004)(110136005)(31696002)(66946007)(36756003)(478600001)(316002)(71200400001)(16576012)(86362001)(66556008)(64756008)(66476007)(53546011)(26005)(2906002)(66446008)(8936002)(16526019)(5660300002)(8676002)(186003)(52116002)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB3461;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 18ThJj+5GIvwe68KkHZNNcBaGIg9tBf1EWNtUPS3zjQVosvflR4QyFH4336i6xvNCKPHs2PL+Fgk5mA/p1gs4h7h3lfm8RGDQHgIcZDZIX8xrzxvXrP2v1mn//o4PQnuTILT4ZwGwtQm5xERciD9QQtM7LOY3XM3vVa3JrDENAYben2hKEld+pACECSi5prEeYAZaWpaYN9peqd1OjrZelfj+O99f8oPWBcvnlErR9pOnZ6/j7yXp6oJ4W2BV8NrVQGfNdf2pBbMA56H54hFdMOef6rnyBwZQTKPdv+TNyMcKlUkv5KB2hSNJZRvBZvYoloxFD9vFT+aXV7y0+s91lCeKgktXA78wHZALUtaD68LFKZEIWLd/8ITsCQvvj8dukN3UAwrjgdUnIPxMbdiKhoXHJ9ZdqGrbwkzO/cN7cV+TljD3sCsOaW3fyY5F/YbGYVP48ZwYBUTou4qIoKLXR3XVxpugb33JFPqDBI+JP8dDLtiTPcJK0vPpS6/qIFeT5nBXsaVilcm7f8k5FUn5w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FF42DCA0A556147AB299440C22F8ED7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401b5c80-f5e8-456a-9293-08d78956bd11
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2019 16:23:13.2340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IjjSOmPdGNbSk3BNj8h9yOssXfROOzuaR4V7dNl818BBpBlgAAqB3nqVwIlfPxYhaP2jpWbM3reV/7nheUfRA/ChRxBdHYgg8esi2WbFhE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3461
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ViWupBea7PC.A.3sC.569AeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/758
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/08f2380d-10c6-ef3c-4361-2c484cd90c81@virtuozzo.com
Resent-Date: Wed, 25 Dec 2019 22:12:09 +0000 (UTC)

MDcuMDkuMjAxOSAyMDoyNiwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4g
MDIuMTAuMjAxOCAxODo1MCwgRXJpYyBCbGFrZSB3cm90ZToNCj4+IE9uIDEwLzIvMTggMTA6MzEg
QU0sIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgd3JvdGU6DQo+Pj4gSG1tLCBFcmljLCB3
aGF0IGFyZSB0aGUgcGxhbnMgYWJvdXQgdGhpcz8NCj4+Pg0KPj4+IE5vdyBpbiB1cHN0cmVhbSBk
aXNjYXJkLCB3cml0ZS16ZXJvcyBhbmQgYmxvY2stc3RhdHVzIGFyZSBsaW1pdGVkIGluDQo+Pj4g
Y2xpZW50IHRvIDMybSBieSBkZWZhdWx0IHdoaWNoIGlzIHRvbyBzbG93Lg0KPj4+IENhbiB3ZSBt
YWtlIHNvbWUgbWluaW1hbCBzcGVjaWZpY2F0aW9uIGNoYW5nZSB0byBkcm9wIHRoZXNlIHN0cmlj
dA0KPj4+IGxpbWl0YXRpb25zPw0KPj4NCj4+IEVsc2V3aGVyZSBpbiB0aGUgdGhyZWFkLCBiYWNr
IGluIE1heToNCj4+DQo+Pj4+PiBTbywgbm93IHdlIGhhdmUgdHdvIHZlcnkgc2ltaWxhciBvcHRp
b25zLCBhbmQgaW4gcmVhbGl6YXRpb24gLSB0d28gYWxtb3N0IGlkZW50aWNhbCBjb2RlIHBhdGhz
Lg0KPj4+Pj4gQXJlIHdlIGdvaW5nIHRvIGFkZCBzaW1pbGFyIGxpbWl0cyBmb3IgQkxPQ0tfU1RB
VFVTPyBhbmQgZm9yIENBQ0hFPyBJIGhhdmUgYW4gaWRlYTogd2hhdCBhYm91dCBzb21lIGtpbmQg
b2YgdW5pdmVyc2FsIG9wdGlvbiBmb3IgaXQ/IFNvbWV0aGluZyBsaWtlDQo+Pj4+Pg0KPj4+Pj4g
b3B0aW9uIElORk9fQ01EX1NJWkU6IHNwZWNpZmljIGxpbWl0cyBmb3IgY29tbWFuZDoNCj4+Pj4+
IMKgwqAgdWludDE2X3QgY29tbWFuZA0KPj4+Pj4gwqDCoCB1aW50MzJfdCBtaW5fYmxvY2sNCj4+
Pj4+IMKgwqAgdWludDMyX3QgbWF4X2Jsb2NrDQo+Pj4+Pg0KPj4+Pj4gYW5kIHNlcnZlciBjYW4g
c2VuZCBzZXZlcmFsIHN1Y2ggb3B0aW9ucywgY2xpZW50IGNhbiByZXF1ZXN0IHRoZW0gaW4gc29t
ZSBnZW5lcmljIHdheS4gTW9zdCBvZiBzZW1hbnRpY3MgZm9yIHRoZXNlIGFkZGl0aW9uYWwgbGlt
aXRzIGFyZSBjb21tb24sIHNvIGl0IHdpbGwgc2ltcGxpZnkgYm90aCBkb2N1bWVudGF0aW9uIGFu
ZCByZWFsaXphdGlvbi4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IFdlIGFscmVhZHkgZG9jdW1lbnQgIkEg
cGFydGljdWxhciBpbmZvcm1hdGlvbiB0eXBlIFNIT1VMRCBvbmx5IGFwcGVhciBvbmNlIGZvciBh
IGdpdmVuIGV4cG9ydCB1bmxlc3MgZG9jdW1lbnRlZCBvdGhlcndpc2UuIiAtIGJ1dCB0aGlzIHdv
dWxkIGluZGVlZCBiZSBhIGNhc2Ugd2hlcmUgd2UgY291bGQgZG9jdW1lbnQgb3RoZXJ3aXNlLg0K
Pj4+Pg0KPj4+PiBEbyB5b3UgZW52aXNpb24gYSBzZXJ2ZXIgdGhhdCBuZWVkcyB0byBoYXZlIGlu
ZGVwZW5kZW50IGxpbWl0cyBmb3IgQ0FDSEUgYW5kL29yIEJMT0NLX1NUQVRVUyBiZXlvbmQgdGhl
IHVzdWFsIGxpbWl0cyBmb3IgUkVBRCwgd2hlcmUgYWR2ZXJ0aXNpbmcgYWx0ZXJuYXRpdmUgbGlt
aXRzIGlzIHdvcnRod2hpbGU/wqAgQnV0IHRoZSBpZGVhIG9mIGhhdmluZyBhIHNpbmdsZSByZXVz
YWJsZSBpbmZvIHRoYXQgZG9jdW1lbnRzIHBlci1jb21tYW5kIGxpbWl0cyBtYXkgYmUgd29ydGgg
dGhlIGVmZm9ydCwgc28gSSdsbCB0cnkgYSB2NSBvZiBib3RoIHRoaXMgcGF0Y2ggYW5kIG9mIHRo
ZSBxZW11IHByb29mLW9mLWNvbmNlcHQgaW1wbGVtZW50YXRpb24gYWxvbmcgdGhvc2UgbGluZXMs
IHNvIHRoYXQgd2UgY2FuIGNvbXBhcmUgdGhlIHR3byBhcHByb2FjaGVzLiANCj4+DQo+PiBJdCdz
IHN0aWxsIG9uIG15IHRvZG8gbGlzdCB0byBwcm9wb3NlIGFuIGFsdGVybmF0aXZlIHdvcmRpbmcg
YWxvbmcgd2l0aCBhIHFlbXUgaW1wbGVtZW50YXRpb24sIGZvciB0aGUgdjUgcG9zdGluZyBvZiB0
aGlzIHRvcGljLsKgIEhvd2V2ZXIsIGl0IGxpa2VseSB3b24ndCBoYXBwZW4gdW50aWwgYWZ0ZXIg
S1ZNIEZvcnVtIGxhdGVyIHRoaXMgbW9udGguDQo+Pg0KPiANCj4gSGkhDQo+IA0KPiBJbnZlc3Rp
Z2F0aW5nIG91ciBoZWFwIG9mIHBhdGNoZXMgaW4gdmlydHVvenpvIHFlbXUgYWJvdmUgcmhlbCBx
ZW11LCBJIG5vdyBsb29rIGF0IHR3byBwYXRjaGVzIHdoaWNoIGFjdHVhbGx5IGRyb3AgdGhlc2Ug
cmVzdHJpY3Rpb25zDQo+IGluIGNsaWVudCBmb3IgV1JJVEVfWkVSTywgVFJJTSBhbmQgQkxPQ0tf
U1RBVFVTLiBTbyBhY3R1YWxseSB3ZSBqdXN0IGxpdmUgd2l0aCBhIGJpdCBub24tY29tcGxpYW50
IGNsaWVudCBmb3IgbW9yZSB0aGFuIHllYXIgZHVlIHRvDQo+IHRoZXNlIHJlc3RyaWN0aW9ucy4u
DQo+IA0KPiBJIGRpZG4ndCBhbnN3ZXIgeW91ciBxdWVzdGlvbiBhYm91dCBCTE9DS19TVEFUVVM6
IHllcywgd2UgbmVlZCBsYXJnZSBCTE9DS19TVEFTVFVTIHJlcXVlc3RzLCBhcyBxZW11LWltZyBj
b252ZXJ0IGRvZXMgYWRkaXRpb25hbCBsb29wDQo+IG9mIGJsb2NrIHN0YXR1cyBxdWVyeWluZyBi
ZWZvcmUgYWN0dWFsIGNvbnZlcnRpbmcsIGFuZCB0aGlzIGxvb3AgaXMgc2xvd2VkIGRvd24gYmVj
YXVzZSBvZiByZXN0cmljdGlvbnMuIEFib3V0IENBQ0hFIEknbSB1bnN1cmUsIHNlZW1zDQo+IHdl
IGRpZG4ndCBmYWNlIHN1Y2ggcHJvYmxlbXMgd2l0aCBpdC4NCj4gDQo+IERvIHlvdSBoYXZlIHBs
YW5zIG9yIGlkZWFzIG9uIHRoaXMgdG9waWM/DQo+IA0KPiBJIHRoaW5rIHRoYXQgZm9yIEJMT0NL
X1NUQVRVUyBhbmQgVFJJTSB3ZSBjYW4gc2FmZWx5IGRyb3AgbWF4X2Jsb2NrIHJlc3RyaWN0aW9u
IGF0IGFsbCwgZG9jdW1lbnRpbmcgdGhhdCBtYXhfYmxvY2sgaXMgdW5yZWxhdGVkIHRvDQo+IHRo
ZXNlIGNvbW1hbmRzLCBhcyBhY3R1YWxseSwgZm9yIEJMT0NLX1NUQVRVUyBzZXJ2ZXIgbWF5IHJl
dHVybiBsZXNzIHRoZW4gcmVxdWlyZWQgYW55d2F5LCBhbmQgVFJJTSBzaG91bGQgbmV2ZXIgbGVh
ZCB0byBzb21lIGJpZw0KPiBhbGxvY2F0aW9ucyBvciBjYWxjdWxhdGlvbnMuLg0KPiANCj4gV1JJ
VEVfWkVSTyBpcyBhIGJpdCB0cmlja2llciwgYXMgaWYgaXQgaXMgYmFja2VkIGJ5IGp1c3Qgd3Jp
dGluZyB6ZXJvZXMsIGJ1dCB3ZSBjYW4gYXQgbGVhc3QgZHJvcCBtYXhfYmxvY2sgcmVzdHJpY3Rp
b24gaWYgRkFTVF9aRVJPDQo+IGZsYWcgaXMgc3BlY2lmaWVkLCB0aGFuIGNsaWVudCBtYXkgaW1w
bGVtZW50IHdyaXRlIHplcm8gYXMNCj4gDQo+IHdyaXRlX3plcm8oRkFTVF9aRVJPKQ0KPiBpZiBm
YWlsZWQ6DQo+ICDCoMKgIHdyaXRpbmcgemVybyBpcyBzbG93IGFueXdheSwgZG8gaXQgaW4gYSBs
b29wLg0KPiANCj4gDQo+IFNvLCBpbiBvdGhlciB3b3JkcywgY2FuIHdlIGRvIHNvbWV0aGluZyBs
aWtlIHRoaXM6DQo+IA0KPiAgwqBkaWZmIC0tZ2l0IGEvZG9jL3Byb3RvLm1kIGIvZG9jL3Byb3Rv
Lm1kDQo+ICDCoGluZGV4IGZjN2JhZjYuLjRiMDY3ZjUgMTAwNjQ0DQo+ICDCoC0tLSBhL2RvYy9w
cm90by5tZA0KPiAgwqArKysgYi9kb2MvcHJvdG8ubWQNCj4gIMKgQEAgLTgxNSw5ICs4MTUsMTIg
QEAgV2hlcmUgYSB0cmFuc21pc3Npb24gcmVxdWVzdCBjYW4gaGF2ZSBhIG5vbnplcm8gKm9mZnNl
dCogYW5kL29yDQo+ICDCoCB0aGUgY2xpZW50IE1VU1QgZW5zdXJlIHRoYXQgKm9mZnNldCogYW5k
ICpsZW5ndGgqIGFyZSBpbnRlZ2VyDQo+ICDCoCBtdWx0aXBsZXMgb2YgYW55IGFkdmVydGlzZWQg
bWluaW11bSBibG9jayBzaXplLCBhbmQgU0hPVUxEIHVzZSBpbnRlZ2VyDQo+ICDCoCBtdWx0aXBs
ZXMgb2YgYW55IGFkdmVydGlzZWQgcHJlZmVycmVkIGJsb2NrIHNpemUgd2hlcmUgcG9zc2libGUu
wqAgRm9yDQo+ICDCoC10aG9zZSByZXF1ZXN0cywgdGhlIGNsaWVudCBNVVNUIE5PVCB1c2UgYSAq
bGVuZ3RoKiBsYXJnZXIgdGhhbiBhbnkNCj4gIMKgLWFkdmVydGlzZWQgbWF4aW11bSBibG9jayBz
aXplIG9yIHdoaWNoLCB3aGVuIGFkZGVkIHRvICpvZmZzZXQqLCB3b3VsZA0KPiAgwqAtZXhjZWVk
IHRoZSBleHBvcnQgc2l6ZS7CoCBUaGUgc2VydmVyIFNIT1VMRCByZXBvcnQgYW4gYE5CRF9FSU5W
QUxgIGVycm9yIGlmDQo+ICDCoCt0aG9zZSByZXF1ZXN0cywgdGhlIGNsaWVudCBNVVNUIE5PVCB1
c2UgYSAqbGVuZ3RoKiB3aGljaCwgd2hlbiBhZGRlZCB0bw0KPiAgwqArKm9mZnNldCosIHdvdWxk
IGV4Y2VlZCB0aGUgZXhwb3J0IHNpemUuIEFsc28gZm9yIE5CRF9DTURfUkVBRCwNCj4gIMKgK05C
RF9DTURfV1JJVEUsIE5CRF9DTURfQ0FDSEUgYW5kIE5CRF9DTURfV1JJVEVfWkVST0VTIChleGNl
cHQgZm9yDQo+ICDCoCt3aGVuIE5CRF9DTURfRkxBR19GQVNUX1pFUk8gaXMgc2V0KSwgdGhlIGNs
aWVudCBNVVNUIE5PVCB1c2UgYSAqbGVuZ3RoKg0KPiAgwqArbGFyZ2VyIHRoYW4gYW55IGFkdmVy
dGlzZWQgbWF4aW11bSBibG9jayBzaXplLg0KPiAgwqArVGhlIHNlcnZlciBTSE9VTEQgcmVwb3J0
IGFuIGBOQkRfRUlOVkFMYCBlcnJvciBpZg0KPiAgwqAgdGhlIGNsaWVudCdzIHJlcXVlc3QgaXMg
bm90IGFsaWduZWQgdG8gYWR2ZXJ0aXNlZCBtaW5pbXVtIGJsb2NrIHNpemUNCj4gIMKgIGJvdW5k
YXJpZXMsIG9yIGlzIGxhcmdlciB0aGFuIHRoZSBhZHZlcnRpc2VkIG1heGltdW0gYmxvY2sgc2l6
ZS4NCj4gIMKgIE5vdHdpdGhzdGFuZGluZyBhbnkgbWF4aW11bSBibG9jayBzaXplIGFkdmVydGlz
ZWQsIGVpdGhlciB0aGUgc2VydmVyDQo+IA0KPiA/DQo+IA0KPiBPciBpdCB3aWxsIG1ha2UgZXhp
c3RlbnQgbmJkIHNlcnZlcnMgbm9uLWNvbXBsaWFudD8gQXQgbGVhc3Qgc2VlbXMgcWVtdSBuYmQg
c2VydmVyIG5ldmVyIGZvcmNlZCB0aGVzZSByZXN0cmljdGlvbnMNCj4gaW4gc3BlY2lmaWVkIGNh
c2VzLg0KPiANCj4gDQo+IEFuZCwgYWRkaXRpb25hbCBpZGVhOiBjYW4gd2UgaW4gcWVtdSBqdXN0
IGlnbm9yZSB0aGVzZSByZXN0cmljdGlvbnMgdXAgdG8gZmlyc3QgRUlOVkFMIHJldHVybmVkPyBT
bywgZm9yIGV4YW1wbGUsDQo+IHdlIHN0YXJ0IHdpdGggYnMtPmJsLm1heF9wd3JpdGVfemVyb2Vz
ID0gSU5UX01BWCwgd2Ugc2VuZCBXUklURV9aRVJPRVMgd2l0aCBsZW5ndGggZXhjZWVkaW5nIG1h
eF9ibG9jaywgaWYgc2VydmVyDQo+IHJlcGxpZXMgd2l0aCBFSU5WQUwgd2UgcmV0cnkgY3VycmVu
dCByZXF1ZXN0IHVzaW5nIGxpbWl0ZWQgbGVuZ3RoICh3ZSBoYXZlIHRvIGRvIGl0IGluIGEgbG9v
cCkgYW5kIHNldA0KPiBicy0+YmwubWF4X3B3cml0ZV96ZXJvZXMgPSBtYXhfYmxvY2suDQo+IA0K
PiANCg0KRXJpYz8gTm93LCBJJ20gaW52ZXN0aWdhdGluZyB0aGUgaGVhcCBhZ2FpbiwgYW5kIHJl
bWVtYmVyIG9mIHRoaXMgdGFsazopIFdoYXQgZG8geW91IHRoaW5rPw0KDQotLSANCkJlc3QgcmVn
YXJkcywNClZsYWRpbWlyDQo=

