Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAC12B495
	for <lists+nbd@lfdr.de>; Fri, 27 Dec 2019 13:45:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DB3DD200FE; Fri, 27 Dec 2019 12:45:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec 27 12:45:08 2019
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,THREADTOPIC
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4CDC9203A3
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Dec 2019 12:27:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.79 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	THREADTOPIC=2] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q6hw4OwoteKZ for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Dec 2019 12:27:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur02-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0703.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe05::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AED6D2039F
	for <nbd@other.debian.org>; Fri, 27 Dec 2019 12:27:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2KYtqfa+6246AH4mWIpMX8QMqszld34myV+ALjkRyoQ4am0JUX49Vu1o4Crzq5IKX6T1A2nhPERnMfQUe8YpZ7xAg5xmd61l2Z/M4Nq+X4/RaVcY4PCPNAMscVeg2o/WY0DWLM9QAePuDzbBFXtkfGZe+JdvdvG5RWpeWsaOld8A4to/3vk9o/IwNYTj5LdHPCEW/0HeOleES00a2mqBHgCsWPLSuYJDVgV6Q6xECyB48uZ/47Vnx/Geh/7ATJX9iH6rb5jjSGZKvdROBL2h7E4W4dzPHRNJnmFoZ8ZRx6uiK1LMGW40K/RONjbBuHr7gmpe9xh1lo86MqMCD4PQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LupygrOLeV67k+CF6CJZVfyZVrXy4NiAm0LBUYpkUkQ=;
 b=Uhs70QjGSn4YdMA6u8T4qBhUEkcvrRPVFdesYyNoTNdMSBn5hhNZpk8T4nM23D3rcqaK//NVKRWGCeVG0aLcG1NuIZA8UW/jvF5mfs4PhFNVtNpJ7uEv7RoBUkszsyxvr+HdUCHE38mHNBIyE07cOL2NsFrkibwM4cMNVQ+OXU+0c6JSnMz9ogbeUAuvegxIuVF2U+IBK7CLTnhzxBxjbVrcGA7btkC2E+mnidVy3c9Xo2oS74Q2ISktEPvXBqZ6wUKrq5Mw11cobQiUo5oD5MxOmixgO9l6eQ9XWPimiMalCo0BSr+eeTD3iEkV0RkZdK7x2BbBcDXXRRgAron/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LupygrOLeV67k+CF6CJZVfyZVrXy4NiAm0LBUYpkUkQ=;
 b=CIKpgKJ+8M3EVV7bzCv9qpgFCx2P6Lhvv5sE9zCS3FvUbPtpzPfGl9wJb+P7mkQBJQ9d9pHVytUnE7f3SP8UkVtPLKFV5zMK5cx/n6/1BFnx68m8T27fiyN/vwxzEQu5DeXAADzAL0f9KJ0TJAWQttftpYfHHSwJ6/rv5+yyL/4=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3958.eurprd08.prod.outlook.com (20.179.1.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 12:13:18 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 12:13:17 +0000
Received: from [172.16.24.200] (185.231.240.5) by HE1PR0501CA0032.eurprd05.prod.outlook.com (2603:10a6:3:1a::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 12:13:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Nir Soffer <nsoffer@redhat.com>, qemu-block <qemu-block@nongnu.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>
CC: Eric Blake <eblake@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Selecting meta context when calling NBD_CMD_BLOCK_STATUS
Thread-Topic: Selecting meta context when calling NBD_CMD_BLOCK_STATUS
Thread-Index: AQHVu/jfmBDsARTG7UuNMkD5BPNat6fN5haA
Date: Fri, 27 Dec 2019 12:13:17 +0000
Message-ID: <11e45957-7a6c-53b6-824d-80f1d5515a4d@virtuozzo.com>
References:
 <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
In-Reply-To:
 <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR0501CA0032.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::42) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191227151315774
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e0858fb-829b-4526-8bcb-08d78ac62814
x-ms-traffictypediagnostic: AM6PR08MB3958:
x-microsoft-antispam-prvs:
 <AM6PR08MB39586013675FBA0EB65AF70BC12A0@AM6PR08MB3958.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(136003)(366004)(376002)(39840400004)(346002)(396003)(189003)(199004)(16576012)(956004)(110136005)(2906002)(81156014)(31686004)(6486002)(71200400001)(81166006)(86362001)(4326008)(316002)(2616005)(5660300002)(8676002)(36756003)(31696002)(54906003)(26005)(478600001)(52116002)(66446008)(64756008)(66556008)(66946007)(8936002)(66476007)(186003)(16526019);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB3958;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SfE2DLyoovg2gWCiDg6C0UxzVEA0F3u+lrzRC3NijNLqwTsGu3y5QPt7xrk0lQYeI80GmZSVl1+hhkRmoDwxYvfODiNwcTINB9uvNi0ywMpF2aYpLfcsvHpG7KQFBspe8ymbpW3jZMDrIb2KSdzT7GJSNyPXcRA5glOU9KySkkSJPDq6I9pXSDsFXwvmmidMTbvBguQ7MHNW/0gNtsk+duvFsRiJjziGhSLuUY+cwRiJE2q7LG82H+ppTBaR0JBBkNrCOrBFF9pe6k8F9/L5VNSl0h1cM5wP2HZcFj76lpB4GJmSeQDMg21LQsRWAUwFiehrMkXnKuCmNKgPFgpOY79l8JgSQWFlqiihalYlyD3m3KIvzgd/xJXu99yBD6CvEZN5ttZAnLDKLBnrqKfdFCU0mg1ejLoIABsDHp40FwGCYQFhpXsHP++/h0v/cl/J
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <74402F65B7BAFB4085072D896C0F8068@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0858fb-829b-4526-8bcb-08d78ac62814
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 12:13:17.8656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+1DqysJa14Qb+HMsPvYiM3a5I7n47cJNUf6R3Iu+kviIUJ2fxVIbxj/3G2qdu4GgX67iJ7ZVzA6pB/bcdjJOraQC0NC2lu3tWDEmjtsU2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3958
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6k-5fTLNq2E.A.jrE.UzfBeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/762
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/11e45957-7a6c-53b6-824d-80f1d5515a4d@virtuozzo.com
Resent-Date: Fri, 27 Dec 2019 12:45:08 +0000 (UTC)

MjYuMTIuMjAxOSAxNzoyOSwgTmlyIFNvZmZlciB3cm90ZToNCj4gQ3VycmVudGx5IGNsaWVudCBu
ZWVkIHRvIHVzZSBOQkRfT1BUX1NFVF9NRVRBX0NPTlRFWFQgZHVyaW5nIGhhbmRzaGFrZSB0bw0K
PiBzZWxlY3QgdGhlIG1ldGEgY29udGV4dCBpdCB3YW50cyB0byBnZXQgaW4gTkJEX0NNRF9CTE9D
S19TVEFUVVMuDQo+IA0KPiBUaGlzIG1lYW5zIHRoYXQgaWYgeW91IHdhbnQgdG8gcHJvdmlkZSB0
aGUgb3B0aW9uIHRvIGdldCBib3RoDQo+ICJiYXNlOmFsbG9jYXRpb24iIGFuZA0KPiAicWVtdTpk
aXJ0eS1iaXRtYXA6eCIgdXNpbmcgdGhlIHNhbWUgTkJEIGNsaWVudCBjb25uZWN0aW9uLCB5b3Ug
bXVzdA0KPiBwYXkgZm9yIGdldHRpbmcNCj4gYm90aCBkdXJpbmcgTkJEX0NNRF9CTE9DS19TVEFU
VVMgZXZlbiBpZiB0aGUgdXNlciBvZiB0aGUgTkJEIGNsaWVudCBpcyBub3QgZ29pbmcNCj4gdG8g
dXNlIGJvdGguDQo+IA0KPiBPciwgeW91IGNhbiB1c2UgbmV3IGNsaWVudCBjb25uZWN0aW9uIGZv
ciBnZXR0aW5nIG1ldGEgY29udGV4dCBub3QNCj4gdGhhdCB0aGUgY3VycmVudA0KPiBjbGllbnQg
ZGlkIG5vdCBzZWxlY3QsIHdoaWNoIHJlcXVpcmUgc2VydmVyIHRoYXQgc3VwcG9ydHMgbXVsdGlw
bGUNCj4gY29ubmVjdGlvbnMsIGFuZCBuZXcNCj4gaGFuZHNoYWtlLiBUaGlzIHNlZW1zIHRvIGJl
IG1vcmUgY29tcGxpY2F0ZWQgdGhhbiBuZWVkZWQuDQoNCkFncmVlLCB0aGF0IGl0J3MgYSB3cm9u
ZyB3YXkNCg0KPiANCj4gVGhpcyBjb21wbGljYXRlcyBleGlzdGluZyBjbGllbnRzOg0KPiAtIHFl
bXUtaW1nIGNhbiByZXR1cm4gZWl0aGVyICJiYXNlOmFsbG9jYXRpb24iIG9yDQo+ICJxZW11OmRp
cnR5LWJpdG1hcDp4IiB1c2luZyBjb21wbGV4DQo+ICAgIHVuZG9jdW1lbnRkZSBjb25maWd1cmF0
aW9uDQo+IC0gb3ZpcnQtaW1hZ2VpbyBpcyB1c2luZyBkaXJ0eSBmbGFnIGluIHRoZSBjbGllbnQg
dG8gZW5hYmxlIGJvdGgNCj4gImJhc2U6YWxsb2NhdGlvbiIgYW5kDQo+ICAgICJxZW11OmRpcnR5
LWJpdG1hcDp4Iiwgc28gd2UgY2FuIHByb3ZpZGUgbWVyZ2VkIGV4dGVudHMgcmVwb3J0aW5nDQo+
IGJvdGggYWxsb2NhdGlvbg0KPiAgICBzdGF0dXMgYW5kICJkaXJ0aW5lc3MiIGZvciBldmVyeSBl
eHRlbnQuDQo+IA0KPiBTaG91bGQgd2UgZXh0ZW5kIE5CRF9DTURfQkxPQ0tfU1RBVFVTIHNvIHdl
IGNhbiBzcGVjaWZ5IGxpc3Qgb2YgbWV0YSBjb250ZXh0DQo+IGF0IHRoZSB0aW1lIG9mIHRoZSBj
YWxsPw0KPiANCj4gTG9va2luZyBhdCBjb21tYW5kIHN0cnVjdHVyZSwgSSBkb24ndCB0aGluayBp
dCBjb3VsZCBiZSBleHRlbmRlZC4gV2UNCj4gbmVlZCB0byBzcGVjaWZ5DQo+IGxpc3Qgb2YgMzIg
Yml0IGNvbnRleHQgaWRzLCBzbyB3ZSBuZWVkIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gMzIgYml0
cywgbGVuZ3RoIG9mIHBheWxvYWQgKE4gKiA0KQ0KPiAzMiBiaXRzLCBjb250ZXggaWQgMQ0KPiAu
Li4NCj4gMzIgYml0cywgY29udGV4dCBpZCBODQo+IA0KPiBCdXQgdGhlIGxlbmd0aCBmaWVsZCBv
ZiBhIEJMT0NLX1NUQVRVUyBjb21tYW5kIGlzIGFscmVhZHkgdXNlZCB0bw0KPiBzcGVjaWZ5IHRo
ZSByYW5nZQ0KPiBvZiB0aGUgcmVwbHkuDQo+IA0KPiBTbyBtYXliZSBhZGQgYSBuZXcgaGFuZHNo
YWtlIGZsYWcsIE5CRF9PUFRfRVhURU5ERURfQ09NTUFORC4gSWYgc2V0IGR1cmluZw0KPiBoYW5k
c2hha2UsIGFuZCBOQkRfRkxBR19FWFRFTkRFRCBpcyBzZXQsIGEgY29tbWFuZCB3aWxsIHN1cHBv
cnQNCj4gYWRkaXRpb25hbCBwYXlsb2FkDQo+IGxpa2UgdGhlIGxpc3Qgb2YgY29udGV4dCBpZHMu
DQo+IA0KPiBTbyBhIEJMT0NLX1NUQVRVUyBjb21tYW5kIHdpbGwgbG9vayBsaWtlOg0KPiANCj4g
QzogMzIgYml0cywgTkJEX1JFUVVFU1RfTUFHSUMpDQo+IEM6IDE2IGJpdHMsIE5CRF9GTEFHX0VY
VEVOREVEDQo+IEM6IDE2IGJpdHMsIE5CRF9DTURfQkxPQ0tfU1RBVFVTDQo+IEM6IDY0IGJpdHMs
IDQyDQo+IEM6IDY0IGJpdHMsIDANCj4gQzogMzIgYml0cywgMTA3Mzc0MTgyNA0KPiBDOiAzMiBi
aXRzOiA0DQo+IEM6IDMyIGJpdDogMQ0KPiANCj4gV2l0aCB0aGlzIHRoZSBzZXJ2ZXIgcmVwbHkg
d2lsbCBiZSBvbmx5IGZvciBjb250ZXh0IGlkIDEuDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8N
Cj4gDQoNCg0KSSdtIGZvci4NCg0KSWYgd2UgYXJlIGdvaW5nIHRvIGV4dGVudCB0aGUgY29tbWFu
ZCwgSSBhbHNvIHdhbnQgYSBwb3NzaWJpbGl0eSB0byB1c2UgNjRiaXQgbGVuZ3RoIGZvcg0KY29t
bWFuZHMgd2l0aCBubyBwYXlsb2FkOiB3cml0ZV96ZXJvLCBkaXNjYXJkLCBibG9ja19zdGF0dXMu
DQoNCkkganVzdCBkb24ndCByZW1lbWJlciB3aGF0IHdhcyB0aGUgcHJvYmxlbXMgd2l0aCBleHRl
bmRpbmcgdGhlIGNvbW1hbmQgc3RydWN0dXJlLA0Kd2UgYWxyZWFkeSBkaXNjdXNzZWQgaXQgYnV0
IHNvbWVob3cgaXQgd2FzIG5vdCBzaW1wbGUuLg0KDQpBaGEsIHRoZSBwcm9ibGVtIGlzIHRoYXQg
aXQgd291bGQgYmUgY29tcGxldGVseSBpbmNvbXBhdGlibGUgZXh0ZW5zaW9uOiB3ZSBjYW4ndCBp
bXBsZW1lbnQNCml0IGluIGEgbWFubmVyIHRoYXQgc2VydmVyIHdoaWNoIGRvbid0IHN1cHBvcnQg
aXQgd2lsbCBqdXN0IHJlcGx5IEVJTlZBTCBvbiBleHRlbmRlZCBjb21tYW5kLA0KYXMgaXQgd2ls
bCBsb3NlIHRoZSBjb3JyZWN0IHBvc2l0aW9uIGluIHRoZSBjb21tYW5kIHN0cmVhbS4uDQoNCkJ1
dCBJIGRvbid0IHRoaW5rIGl0J3MgdGhlIHJlYXNvbiB0byBuZXZlciBleHRlbmQgdGhlIGNvbW1h
bmQuIE1heWJlLCB0aGUgZmlyc3Qgc3RlcCBzaG91bGQNCmJlIGltcGxlbWVudGluZyBjbWRfbGVu
Z3RoIGZpZWxkIGZlYXR1cmUsIHNvLCBpZiBpdCBpcyBuZWdvdGlhdGVkLCB0aGFuIGFsbCBjb21t
YW5kcyBhcmUNCmV4dGVuZGVkIGJ5IGNtZF9sZW5ndGggZmllbGQgd2hpY2ggZGVmaW5lcyB0aGUg
bGVuZ3RoIG9mIHRoZSBjb21tYW5kIGluIHRoZSBzdHJlYW0uDQoNClRoZW4gd2UnbGwgYmUgYWJs
ZSB0byBleHRlbmQgY29tbWFuZHMgYXMgd2Ugd2FudC4uDQoNCg0KDQotLSANCkJlc3QgcmVnYXJk
cywNClZsYWRpbWlyDQo=

