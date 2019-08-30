Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E93DCA3D97
	for <lists+nbd@lfdr.de>; Fri, 30 Aug 2019 20:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ACF712068E; Fri, 30 Aug 2019 18:18:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 30 18:18:11 2019
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,THREADTOPIC
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 675632085A
	for <lists-other-nbd@bendel.debian.org>; Fri, 30 Aug 2019 18:00:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.94 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GaEsBzYHDPy7 for <lists-other-nbd@bendel.debian.org>;
	Fri, 30 Aug 2019 18:00:44 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur02-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 167274 seconds by postgrey-1.36 at bendel; Fri, 30 Aug 2019 18:00:43 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe05::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CF8962085E
	for <nbd@other.debian.org>; Fri, 30 Aug 2019 18:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUxBMt9C8xPLoaLMXT4148jlCUSGzJtDIsvPLeyT0mc+aDnD0lWlTCgAKbPfghh3HRDoUQg/MgpKJDTNVaO9M6QOCs/qp2585gTL41j328RobL6TrVJ2El64tjBj7grrsZvpZl7wP0YtUwVjUi7XndcbALpKNYsTzoW1R/DsncvwjrtEaJ1aMm+VpB9ro17y97FIYT7m1V3e+iByh/6PikyqM7rigJ9QKtQAr0Zp5HI8CkiK+te1wqnNU6xyOnPy/jrvPylALHXx53x4p+geBZcfa8oU0bJMNu02wzSIfon/f355qPgFteYOaDAv+urcp9rY40PlvoidNKP1a6QwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcRn23jzlPgZSIf5mxpOpmM+iG56cZoLYjpKotQnudY=;
 b=KZiBC8EgKfFFMcDafOfDvJ1ZfhnoANdW99OZakLdEKrZLSq+09d/L8oDXr+aGrfWzkyFns47LnWfCtEo1yfoYUxiHC9zirvBQWK4NyqtFpSPmzhUlKdl8TF6C1RodawM8VWk0Iy2M0UaKVcaBfCsbX6TtzKZd5vG+zo62XYN8q3WBl1+FSWUm52Fe/AyWEKenJmLnkItfh+ie+KeqHfQxel6JwDQeYKdKVK5corrRcmNa41h6d+4r/bbh50/d+Ihq8F3mrQ1k1wCmDp4y8eL13RXJdHHBc/wr5+nEUBcimj6i6JJzapOVWJkLNC5kPljGYNnbf4jwCAOBESe6riJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcRn23jzlPgZSIf5mxpOpmM+iG56cZoLYjpKotQnudY=;
 b=PU4Setc0VLob48wozqH+8RMrFy5dMFYaQDbYJ3VE5OhzpicSkGAC2xYflGWR6EIP0aCkXKP31tLS0W8cdRrIbuP+4wX03Q2404kcgE0Fh2wMTFkbqYIi5i777k9PPjuBJsdxKaDvaCdTi0wdIwGHIPiKyYSvRHvw6YOyV7UmZFU=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB4937.eurprd08.prod.outlook.com (10.255.19.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 18:00:38 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 18:00:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "open
 list:Network Block Dev..." <qemu-block@nongnu.org>, "libguestfs@redhat.com"
	<libguestfs@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>
Subject: Re: [Qemu-devel] [PATCH 1/5] nbd: Improve per-export flag handling in
 server
Thread-Topic: [Qemu-devel] [PATCH 1/5] nbd: Improve per-export flag handling
 in server
Thread-Index: AQHVWcKKpZ1kXbNK00iz+Po90P7KVacUBh+A
Date: Fri, 30 Aug 2019 18:00:37 +0000
Message-ID: <92e9cfa2-fbaa-259d-7a04-91187cc809b6@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-2-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-2-eblake@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR05CA0350.eurprd05.prod.outlook.com
 (2603:10a6:7:92::45) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190830210035302
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5954877-38d5-43d2-c67d-08d72d73f67d
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB4937;
x-ms-traffictypediagnostic: DB8PR08MB4937:
x-microsoft-antispam-prvs:
 <DB8PR08MB49377600FE1F4058BFBFD7EBC1BD0@DB8PR08MB4937.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(136003)(39850400004)(396003)(366004)(376002)(346002)(189003)(199004)(256004)(6116002)(386003)(316002)(66946007)(81166006)(2501003)(66556008)(66446008)(64756008)(66476007)(14454004)(8936002)(36756003)(81156014)(66066001)(86362001)(31686004)(71190400001)(6512007)(110136005)(71200400001)(52116002)(5660300002)(6436002)(476003)(486006)(31696002)(6246003)(14444005)(76176011)(229853002)(53936002)(102836004)(99286004)(478600001)(6486002)(2906002)(446003)(11346002)(26005)(2616005)(186003)(4326008)(3846002)(305945005)(7736002)(8676002)(6506007)(54906003)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB4937;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 UjMdQk9nUAaos6B9OxjGsPlr9KXpW4+2aDj66bh1uKAj0o9WQZX7XOKAoaetftqAriOzRrJXAmmhi5Lpj87JA+w7L+RYqFJYXQb7MLGJ/enqoP+jFRFQeFczl+SopK9YyqFftsSCglDf2Y0jXsomh8kisqNwd7huy7KgLKJ/y0K4xz2gbmuUd8EzCDNYvD2xhi+UyUTmTz8pleOVYY4toIqTJUV/iGw7GAOX1yUEL4NjpHinyZH8dz8nVzIuorj19JVqkgbQH5VYuoYVSM3EEPHJ6Dch4kysIl23O8RBfdX79Z/3SnZZg1EyLUM/nr/R+DAGjono7VoPEuCdBKqLtiQ16zB2mHvzE79ESWFIm4MuqCQfnt2jIxc21lgx/F/gOEPjD2oisCJPGgJdT3N7V3hZBMYrAEhFHmdIUagNO4E=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <89329BF94AA0884197E9BD15A4CD520D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5954877-38d5-43d2-c67d-08d72d73f67d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 18:00:37.8733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nQewBh61yzKE2JnFI3s5IlV5a+iT6umoMBaZw8BTuz3dYz4xRhjCPnWT02jC+QUMjRUhFwe3csA2niTS2zpdkUU6sxYQWonoO+qjLur6eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4937
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <N9eEfIjH07F.A.2JF.jhWadB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/665
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/92e9cfa2-fbaa-259d-7a04-91187cc809b6@virtuozzo.com
Resent-Date: Fri, 30 Aug 2019 18:18:11 +0000 (UTC)

MjMuMDguMjAxOSAxNzozNywgRXJpYyBCbGFrZSB3cm90ZToNCj4gV2hlbiBjcmVhdGluZyBhIHJl
YWQtb25seSBpbWFnZSwgd2UgYXJlIHN0aWxsIGFkdmVydGlzaW5nIHN1cHBvcnQgZm9yDQo+IFRS
SU0gYW5kIFdSSVRFX1pFUk9FUyB0byB0aGUgY2xpZW50LCBldmVuIHRob3VnaCB0aGUgY2xpZW50
IHNob3VsZCBub3QNCj4gYmUgaXNzdWluZyB0aG9zZSBjb21tYW5kcy4gIEJ1dCBzZWVpbmcgdGhp
cyByZXF1aXJlcyBsb29raW5nIGFjcm9zcw0KPiBtdWx0aXBsZSBmdW5jdGlvbnM6DQo+IA0KPiBB
bGwgY2FsbGVycyB0byBuYmRfZXhwb3J0X25ldygpIHBhc3NlZCBhIHNpbmdsZSBmbGFnIGJhc2Vk
IHNvbGVseSBvbg0KPiB3aGV0aGVyIHRoZSBleHBvcnQgYWxsb3dzIHdyaXRlcy4gIExhdGVyLCB3
ZSB0aGVuIHBhc3MgYSBjb25zdGFudCBzZXQNCj4gb2YgZmxhZ3MgdG8gbmJkX25lZ290aWF0ZV9v
cHRpb25zKCkgKG5hbWVseSwgdGhlIHNldCBvZiBmbGFncyB3aGljaCB3ZQ0KPiBhbHdheXMgc3Vw
cG9ydCwgYXQgbGVhc3QgZm9yIHdyaXRhYmxlIGltYWdlcyksIHdoaWNoIGlzIHRoZW4gZnVydGhl
cg0KPiBkeW5hbWljYWxseSBtb2RpZmllZCBiYXNlZCBvbiBjbGllbnQgcmVxdWVzdHMgZm9yIHN0
cnVjdHVyZWQgb3B0aW9ucy4NCj4gRmluYWxseSwgd2hlbiBwcm9jZXNzaW5nIE5CRF9PUFRfRVhQ
T1JUX05BTUUgb3IgTkJEX09QVF9FWFBPUlRfR08gd2UNCj4gYml0d2lzZS1vciB0aGUgb3JpZ2lu
YWwgY2FsbGVyJ3MgZmxhZyB3aXRoIHRoZSBydW50aW1lIHNldCBvZiBmbGFncw0KPiB3ZSd2ZSBi
dWlsdCB1cCBvdmVyIHNldmVyYWwgZnVuY3Rpb25zLg0KPiANCj4gTGV0J3MgcmVmYWN0b3IgdGhp
bmdzIHRvIGluc3RlYWQgY29tcHV0ZSBhIGJhc2VsaW5lIG9mIGZsYWdzIGFzIHNvb24NCj4gYXMg
cG9zc2libGUsIGluIG5iZF9leHBvcnRfbmV3KCksIGFuZCBjaGFuZ2luZyB0aGUgc2lnbmF0dXJl
IGZvciB0aGUNCj4gY2FsbGVycyB0byBwYXNzIGluIGEgc2ltcGxlciBib29sIHJhdGhlciB0aGFu
IGhhdmluZyB0byBmaWd1cmUgb3V0DQo+IGZsYWdzLiAgV2UgY2FuIHRoZW4gZ2V0IHJpZCBvZiB0
aGUgJ215ZmxhZ3MnIHBhcmFtZXRlciB0byB2YXJpb3VzDQo+IGZ1bmN0aW9ucywgYW5kIGluc3Rl
YWQgcmVmZXIgdG8gY2xpZW50IGZvciBldmVyeXRoaW5nIHdlIG5lZWQgKHdlDQo+IHN0aWxsIGhh
dmUgdG8gcGVyZm9ybSBhIGJpdHdpc2UtT1IgZHVyaW5nIE5CRF9PUFRfRVhQT1JUX05BTUUgYW5k
DQo+IE5CRF9PUFRfRVhQT1JUX0dPLCBidXQgaXQncyBlYXNpZXIgdG8gc2VlIHdoYXQgaXMgYmVp
bmcgY29tcHV0ZWQpLg0KPiBUaGlzIGxldHMgdXMgcXVpdCBhZHZlcnRpc2luZyBzZW5zZWxlc3Mg
ZmxhZ3MgZm9yIHJlYWQtb25seSBpbWFnZXMsIGFzDQo+IHdlbGwgYXMgbWFraW5nIHRoZSBuZXh0
IHBhdGNoIGZvciBleHBvc2luZyBGQVNUX1pFUk8gc3VwcG9ydCBlYXNpZXIgdG8NCj4gd3JpdGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4NCj4g
LS0tDQo+ICAgaW5jbHVkZS9ibG9jay9uYmQuaCB8ICAyICstDQo+ICAgYmxvY2tkZXYtbmJkLmMg
ICAgICB8ICAzICstLQ0KPiAgIG5iZC9zZXJ2ZXIuYyAgICAgICAgfCA2MiArKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBxZW11LW5iZC5jICAgICAgICAg
IHwgIDYgKystLS0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDM0IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYmxvY2svbmJkLmggYi9pbmNs
dWRlL2Jsb2NrL25iZC5oDQo+IGluZGV4IDk5MWZkNTJhNTEzNC4uMmM4N2I0MmRmZDQ4IDEwMDY0
NA0KPiAtLS0gYS9pbmNsdWRlL2Jsb2NrL25iZC5oDQo+ICsrKyBiL2luY2x1ZGUvYmxvY2svbmJk
LmgNCj4gQEAgLTMyNiw3ICszMjYsNyBAQCB0eXBlZGVmIHN0cnVjdCBOQkRDbGllbnQgTkJEQ2xp
ZW50Ow0KPiANCj4gICBOQkRFeHBvcnQgKm5iZF9leHBvcnRfbmV3KEJsb2NrRHJpdmVyU3RhdGUg
KmJzLCB1aW50NjRfdCBkZXZfb2Zmc2V0LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDY0X3Qgc2l6ZSwgY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqZGVzYywNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqYml0bWFwLCB1aW50MTZfdCBuYmRm
bGFncywgYm9vbCBzaGFyZWQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNo
YXIgKmJpdG1hcCwgYm9vbCByZWFkb25seSwgYm9vbCBzaGFyZWQsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkICgqY2xvc2UpKE5CREV4cG9ydCAqKSwgYm9vbCB3cml0ZXRocm91
Z2gsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCbG9ja0JhY2tlbmQgKm9uX2VqZWN0
X2JsaywgRXJyb3IgKiplcnJwKTsNCj4gICB2b2lkIG5iZF9leHBvcnRfY2xvc2UoTkJERXhwb3J0
ICpleHApOw0KPiBkaWZmIC0tZ2l0IGEvYmxvY2tkZXYtbmJkLmMgYi9ibG9ja2Rldi1uYmQuYw0K
PiBpbmRleCBlY2ZhMmVmMGFkYjUuLjFjZGZmYWI0ZmNlMSAxMDA2NDQNCj4gLS0tIGEvYmxvY2tk
ZXYtbmJkLmMNCj4gKysrIGIvYmxvY2tkZXYtbmJkLmMNCj4gQEAgLTE4Nyw4ICsxODcsNyBAQCB2
b2lkIHFtcF9uYmRfc2VydmVyX2FkZChjb25zdCBjaGFyICpkZXZpY2UsIGJvb2wgaGFzX25hbWUs
IGNvbnN0IGNoYXIgKm5hbWUsDQo+ICAgICAgICAgICB3cml0YWJsZSA9IGZhbHNlOw0KPiAgICAg
ICB9DQo+IA0KPiAtICAgIGV4cCA9IG5iZF9leHBvcnRfbmV3KGJzLCAwLCBsZW4sIG5hbWUsIE5V
TEwsIGJpdG1hcCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICB3cml0YWJsZSA/IDAgOiBO
QkRfRkxBR19SRUFEX09OTFksICF3cml0YWJsZSwNCj4gKyAgICBleHAgPSBuYmRfZXhwb3J0X25l
dyhicywgMCwgbGVuLCBuYW1lLCBOVUxMLCBiaXRtYXAsICF3cml0YWJsZSwgIXdyaXRhYmxlLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCBmYWxzZSwgb25fZWplY3RfYmxrLCBl
cnJwKTsNCj4gICAgICAgaWYgKCFleHApIHsNCj4gICAgICAgICAgIHJldHVybjsNCj4gZGlmZiAt
LWdpdCBhL25iZC9zZXJ2ZXIuYyBiL25iZC9zZXJ2ZXIuYw0KPiBpbmRleCAwZmI0MWM2YzUwZWEu
LmI1NTc3ODI4YWE0NCAxMDA2NDQNCj4gLS0tIGEvbmJkL3NlcnZlci5jDQo+ICsrKyBiL25iZC9z
ZXJ2ZXIuYw0KPiBAQCAtNDIzLDE0ICs0MjMsMTQgQEAgc3RhdGljIHZvaWQgbmJkX2NoZWNrX21l
dGFfZXhwb3J0KE5CRENsaWVudCAqY2xpZW50KQ0KPiANCj4gICAvKiBTZW5kIGEgcmVwbHkgdG8g
TkJEX09QVF9FWFBPUlRfTkFNRS4NCj4gICAgKiBSZXR1cm4gLWVycm5vIG9uIGVycm9yLCAwIG9u
IHN1Y2Nlc3MuICovDQo+IC1zdGF0aWMgaW50IG5iZF9uZWdvdGlhdGVfaGFuZGxlX2V4cG9ydF9u
YW1lKE5CRENsaWVudCAqY2xpZW50LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MTZfdCBteWZsYWdzLCBib29sIG5vX3plcm9lcywNCj4gK3N0YXRp
YyBpbnQgbmJkX25lZ290aWF0ZV9oYW5kbGVfZXhwb3J0X25hbWUoTkJEQ2xpZW50ICpjbGllbnQs
IGJvb2wgbm9femVyb2VzLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRXJyb3IgKiplcnJwKQ0KPiAgIHsNCj4gICAgICAgY2hhciBuYW1lW05CRF9NQVhf
TkFNRV9TSVpFICsgMV07DQo+ICAgICAgIGNoYXIgYnVmW05CRF9SRVBMWV9FWFBPUlRfTkFNRV9T
SVpFXSA9ICIiOw0KPiAgICAgICBzaXplX3QgbGVuOw0KPiAgICAgICBpbnQgcmV0Ow0KPiArICAg
IHVpbnQxNl90IG15ZmxhZ3M7DQo+IA0KPiAgICAgICAvKiBDbGllbnQgc2VuZHM6DQo+ICAgICAg
ICAgICBbMjAgLi4gIHh4XSAgIGV4cG9ydCBuYW1lIChsZW5ndGggYnl0ZXMpDQo+IEBAIC00NTgs
MTAgKzQ1OCwxMyBAQCBzdGF0aWMgaW50IG5iZF9uZWdvdGlhdGVfaGFuZGxlX2V4cG9ydF9uYW1l
KE5CRENsaWVudCAqY2xpZW50LA0KPiAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAg
IH0NCj4gDQo+IC0gICAgdHJhY2VfbmJkX25lZ290aWF0ZV9uZXdfc3R5bGVfc2l6ZV9mbGFncyhj
bGllbnQtPmV4cC0+c2l6ZSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNsaWVudC0+ZXhwLT5uYmRmbGFncyB8IG15ZmxhZ3MpOw0KPiArICAgIG15Zmxh
Z3MgPSBjbGllbnQtPmV4cC0+bmJkZmxhZ3M7DQo+ICsgICAgaWYgKGNsaWVudC0+c3RydWN0dXJl
ZF9yZXBseSkgew0KPiArICAgICAgICBteWZsYWdzIHw9IE5CRF9GTEFHX1NFTkRfREY7DQo+ICsg
ICAgfQ0KDQoNCndoeSB3ZSBjYW50IGRvIGp1c3QNCmNsaWVudC0+ZXhwLT5uYmRmbGFncyB8PSBO
QkRfRkxBR19TRU5EX0RGID8NCg0KT3IgZXZlbiBkbyBpdCBlYXJsaWVyLCB3aGVuIGNsaWVudC0+
c3RydWN0dXJlZF9yZXBseSBiZWNvbWVzIHRydWU/DQoNCj4gKyAgICB0cmFjZV9uYmRfbmVnb3Rp
YXRlX25ld19zdHlsZV9zaXplX2ZsYWdzKGNsaWVudC0+ZXhwLT5zaXplLCBteWZsYWdzKTsNCj4g
ICAgICAgc3RxX2JlX3AoYnVmLCBjbGllbnQtPmV4cC0+c2l6ZSk7DQo+IC0gICAgc3R3X2JlX3Ao
YnVmICsgOCwgY2xpZW50LT5leHAtPm5iZGZsYWdzIHwgbXlmbGFncyk7DQo+ICsgICAgc3R3X2Jl
X3AoYnVmICsgOCwgbXlmbGFncyk7DQo+ICAgICAgIGxlbiA9IG5vX3plcm9lcyA/IDEwIDogc2l6
ZW9mKGJ1Zik7DQo+ICAgICAgIHJldCA9IG5iZF93cml0ZShjbGllbnQtPmlvYywgYnVmLCBsZW4s
IGVycnApOw0KPiAgICAgICBpZiAocmV0IDwgMCkgew0KPiBAQCAtNTI2LDggKzUyOSw3IEBAIHN0
YXRpYyBpbnQgbmJkX3JlamVjdF9sZW5ndGgoTkJEQ2xpZW50ICpjbGllbnQsIGJvb2wgZmF0YWws
IEVycm9yICoqZXJycCkNCj4gICAvKiBIYW5kbGUgTkJEX09QVF9JTkZPIGFuZCBOQkRfT1BUX0dP
Lg0KPiAgICAqIFJldHVybiAtZXJybm8gb24gZXJyb3IsIDAgaWYgcmVhZHkgZm9yIG5leHQgb3B0
aW9uLCBhbmQgMSB0byBtb3ZlDQo+ICAgICogaW50byB0cmFuc21pc3Npb24gcGhhc2UuICAqLw0K
PiAtc3RhdGljIGludCBuYmRfbmVnb3RpYXRlX2hhbmRsZV9pbmZvKE5CRENsaWVudCAqY2xpZW50
LCB1aW50MTZfdCBteWZsYWdzLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEVycm9yICoqZXJycCkNCj4gK3N0YXRpYyBpbnQgbmJkX25lZ290aWF0ZV9oYW5kbGVfaW5m
byhOQkRDbGllbnQgKmNsaWVudCwgRXJyb3IgKiplcnJwKQ0KPiAgIHsNCj4gICAgICAgaW50IHJj
Ow0KPiAgICAgICBjaGFyIG5hbWVbTkJEX01BWF9OQU1FX1NJWkUgKyAxXTsNCg0KWy4uXQ0KDQoN
Ci0tIA0KQmVzdCByZWdhcmRzLA0KVmxhZGltaXINCg==

