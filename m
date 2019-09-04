Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 39126A86EF
	for <lists+nbd@lfdr.de>; Wed,  4 Sep 2019 19:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 03393202B1; Wed,  4 Sep 2019 17:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  4 17:24:08 2019
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,THREADTOPIC autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6939B201F1
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Sep 2019 17:08:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3X6I5FUJvYoD for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Sep 2019 17:08:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur02-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on071d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe05::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 86E272016D
	for <nbd@other.debian.org>; Wed,  4 Sep 2019 17:08:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itppC8sZh9TGtJzouq0a+/WUl1ChbpXBHdjl/nrDKxwPJ2MGFR98PGLIML9cOy6K0BxRHBZTJLA926r1zOBO6j1U2sfTf4cWMkJX14/u9DexIg02MW7gXvxHWZoesuywQt4IwOCpzeBnIGejZVHm+R3Bti/TNWhH0YMertZ/P2B+81jTdzf+IZdi2r6Z2LPAvGjQdtkecdCoejuPoIKjmnPt50Uh0HAURnhPo+s3j/ujF0SQww7wO0l99nJbEmvSHYYFUzVu8xW80jdf/TUyL7IEGVAnwtFDYZQP0eujticke9/iMk1MdopRlmwm8yAerFfVedyHmCF8lsbBST5ifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1kGGWtF2EyI9Pw8mcZ/Ps+7K+b3H0B8PZ0wty64Jvw=;
 b=bf8rEyN44a/9xp90G6zXC7NoY/94boRi7DY7FjRFm/XmhMF47WVgIojiCYJfuRvWPT660rY5y9o06IlQEtfsFniMRVeDFG9bPBZcOmuTbzw0Vh5n1Qab+N96i9ubDFnah+Y5WRccjNGUQkZCBY70gp7YpeUI4w4hVvUZqUdhdtVRADLqrPcQ66T67XKbc3jOGPsr+eX1F0g3HPgbbe/6cQ9gHhDPjqruw4cwKvs0IeAS15iw10NmB/fIWzO3VSuQR5eL002shTZHSA+G35oIZIo3V4LzYkW3BGPsbovOygMAvI3Sl/nJ5591wDSCFonTY932P8/K9H6cajU7m2N2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1kGGWtF2EyI9Pw8mcZ/Ps+7K+b3H0B8PZ0wty64Jvw=;
 b=afmZyYADilWGYFpv3sZL/q3fmCqNX5EgpiB/ld7EZdfrt3fb2VeeVcJkY0fWQkqK4Wbx0tpt/Q1N7aYgixJTeg/oxQ1UZ1ub4ubvq6S2etojR599L31niDdEHEWU946xLzr8X9fMwdFxi7iBRpkRre18ihDh1dGg5STBrqN+aVc=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB4092.eurprd08.prod.outlook.com (20.179.9.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 17:08:15 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 17:08:15 +0000
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
Thread-Index: AQHVWcKKpZ1kXbNK00iz+Po90P7KVacb0yaA
Date: Wed, 4 Sep 2019 17:08:15 +0000
Message-ID: <d1ec0e0d-791a-4a19-ec45-e5dbdb8f0106@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-2-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-2-eblake@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR0301CA0016.eurprd03.prod.outlook.com
 (2603:10a6:3:76::26) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190904200813206
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 772ec01c-8c4c-44f3-9518-08d7315a79ac
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB4092;
x-ms-traffictypediagnostic: DB8PR08MB4092:
x-microsoft-antispam-prvs:
 <DB8PR08MB4092C1CDB679750AD8FDAB23C1B80@DB8PR08MB4092.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(39850400004)(366004)(396003)(376002)(346002)(136003)(189003)(199004)(86362001)(66556008)(66946007)(305945005)(31696002)(256004)(66476007)(386003)(25786009)(7736002)(71190400001)(71200400001)(2501003)(6506007)(229853002)(476003)(11346002)(64756008)(2616005)(5660300002)(486006)(446003)(66446008)(4326008)(3846002)(8936002)(186003)(6116002)(36756003)(99286004)(53936002)(316002)(14454004)(6436002)(76176011)(478600001)(54906003)(52116002)(6486002)(6512007)(110136005)(6246003)(2906002)(26005)(31686004)(8676002)(102836004)(81156014)(81166006)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB4092;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 HLyxIS1KpqJzv9IkPIVhT2D/D14BkdBGHHLr7CAMbpQxwqjEvHK0IZeIUV9PLURSC8UIJLNN+lKWpgKq/95TkwHCBtyUt/EVbEKEqgbNOwQZ2kmJcEZCTd+t3FVV18q1tSNQ1hpP8CvJfA9Lr5CV96jYQ/p/oGaz8rrM20fqgySfXs0IoRl7Md6ZMtixB10/6eCkVJK6Wm14m0fO2bA3VfxPV3wwlCK8f3+qNCssq1jPDmGVY6vYtRDfsw2Iv/8soeZcjYmebxSUYRL/KZPGg23fKRZZ7tb7jZ02ro/R3aCOoIIdAzeQvwp36KdBSGuTWnz9BhJL/sR6P7ldLowXBeH566Fy7cCiDUYHHOdv+3MrHL8n1rKZmru9+12+BFs6Sf/aRLwTNeQ8ujAx++OCjDC/Mouj1/pg1EFrEH8ZDt4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D718742F8112148800E572CD5B23118@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772ec01c-8c4c-44f3-9518-08d7315a79ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 17:08:15.7207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzbRtrb+9DxMETn9r2DA5yRUkwV68jvE3oUL3Aai1YKZKHWi7EAJo603qlENhcpGHYn5BV5dPrrL35c0i8i0jHWpTEacEVJjL6K0zeRvmc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4092
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HWKap1iGGON.A.JFE.4M_bdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/682
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d1ec0e0d-791a-4a19-ec45-e5dbdb8f0106@virtuozzo.com
Resent-Date: Wed,  4 Sep 2019 17:24:09 +0000 (UTC)

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
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIEJsYWtlPGVibGFrZUByZWRoYXQuY29tPg0KDQpS
ZXZpZXdlZC1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0
dW96em8uY29tPg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQo=

