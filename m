Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37FA3DCE
	for <lists+nbd@lfdr.de>; Fri, 30 Aug 2019 20:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 781B220898; Fri, 30 Aug 2019 18:39:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 30 18:39:08 2019
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,THREADTOPIC autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 32C6620858
	for <lists-other-nbd@bendel.debian.org>; Fri, 30 Aug 2019 18:21:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cP_MsBKZpCoO for <lists-other-nbd@bendel.debian.org>;
	Fri, 30 Aug 2019 18:21:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur03-db5-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-db5eur03on0716.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0a::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 669E72068E
	for <nbd@other.debian.org>; Fri, 30 Aug 2019 18:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwUIu3tNuwdlOf5O4kxSkii0sJHFwogIe6A9YnGl+UreF5v0fB9vKBZnnq/oUDfIdNnMgAC3ZL+njcK/KPUs+Pg7zpFLmZJs4yJJb/eCl4c+AONQbNyybqbeY4gw+zlh1MBGQo7xrUFyTyhw2Bafk4uDjCLcpDFlcF5dbx2lGiNutAf3RadT1K1ioM6FzXTDDaM3lTq20R9N1Qzguj2fFhKmmn/dzTs4VgdpCuBGdkVOzUxSPVKhH4WlMe11fGIZt7aDE+Rjatu7qcErXIKtvlR1MfPuYlWG2cYJ5jdYoMXKMH4aHPQyVZJaloc9MXqDjPg/LdRcMhleaqZPDgNi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1kFAMMfHEfPVxj2xao13shY0DpQQrKsFBTr/09fKuE=;
 b=TxpndtIBSKYqTySGFOdg0b8M1dd07qsBG/68+vgY0EfV1rLb72IH8hfeJzxbf/HtsCXFKctRAnlTeQf1McmqH1EdetpX7v9+THO2MJ5/MS7M1thcnHosBLLV8DQx5T8KCf97JfPhfc2sc/CGTCAQXlAZC+lO0rqUrakKGa3oMtQkNz3Y6EWxYbEWq9obqXhRRGUnQzb9tCZjjhFXxp/5c4a5dSJygc6GVoNgtw2b9nFiEGWttfrYogFyOXOYXchLjIZzWcJR45gYe1JCIK3euMSIN/LWgGlsh5qfsAakNA0hecHZ7uehs2wNazxGmPqA9YelJNEOwCf/eccNINGS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1kFAMMfHEfPVxj2xao13shY0DpQQrKsFBTr/09fKuE=;
 b=vTVGV+nuNyRUGWaJXasPx7dbup4Sz48UkHRgXvjA4Lxeew+WrIE00Jkxq776qCnzoZvodMiratuMeEmFHBZyBCeujGZRQntFKJ639E5EqUNJBTOTJwm1jjTqRt+jlD0e6OsNQXNzk55nx59cJDA0214ejiPeWShaOXmSDurPyMY=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5386.eurprd08.prod.outlook.com (52.133.241.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 18:07:24 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 18:07:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "open
 list:Network Block Dev..." <qemu-block@nongnu.org>, "libguestfs@redhat.com"
	<libguestfs@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>
Subject: Re: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
Thread-Topic: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
Thread-Index: AQHVWcJnZgUz/ZiSEEiPmfDFNqlCh6cUCAIA
Date: Fri, 30 Aug 2019 18:07:23 +0000
Message-ID: <9476b1d1-47e4-ecfd-eb23-5b2fbc1410e3@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-3-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-3-eblake@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR06CA0142.eurprd06.prod.outlook.com
 (2603:10a6:7:16::29) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190830210720538
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af6b3d73-06df-47d3-319c-08d72d74e873
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB5386;
x-ms-traffictypediagnostic: DB8PR08MB5386:
x-microsoft-antispam-prvs:
 <DB8PR08MB538605DA050A744190C63D72C1BD0@DB8PR08MB5386.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(39850400004)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(14444005)(31696002)(486006)(229853002)(386003)(14454004)(3846002)(478600001)(7736002)(102836004)(6116002)(2501003)(52116002)(6506007)(5660300002)(36756003)(316002)(8936002)(110136005)(86362001)(6436002)(53936002)(6246003)(2906002)(99286004)(6512007)(11346002)(26005)(31686004)(305945005)(71200400001)(71190400001)(54906003)(64756008)(66556008)(2616005)(6486002)(66066001)(446003)(476003)(66446008)(66476007)(81156014)(81166006)(256004)(186003)(4326008)(25786009)(76176011)(8676002)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB5386;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 4Qk/QTv374GQvfRscXWCaS8z0Ya+UIlTcMh4njzm2BUINrnvMr6kN9ALB75N7VaHrTR3/hDx10pFQVtQBI4EN9EyZVkEJj+F35AtzWFNTJcwuoyLFfGQFKkHDzL1qHvV5pL5nq4jRYsdf/XEdC7pCyR++gVJfvi8pyw8sQaDG0GbcH4qcuZHLKsMmPXUrsBJW0inZTig89No41cLLmp6vFqd68fK7DO3L55U61f2dAnoSLPOJfk8EIa913LOc+dKt57GyIZRPhm+9gmy07Sn9QORO6McAtJPqw89avVRtooKHERRne89U1xlxwcFjMOisI+O4M2ftf3dTXQvVziA3izrK6ZSf25SFeb1Q6zFSGezcZDXXaBVQCXYtLfc84W1Bsj4B1jItGHvnOJKhsBzYtLsRExmPJwUZsldM3jT3fg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <99FE13E853CF4944A369097AF7CDE501@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6b3d73-06df-47d3-319c-08d72d74e873
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 18:07:23.7885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyPvoUv6dBxtWfOy95pMfqLpc8vGmkoIhmNCIOjkDjB8ryq9pft2AvEzNTRm+X6ZZvU3P5UmOB3twf6NP7PgmNnY3Q3aJnBx3u7nALbC8ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5386
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WI1c03RDWGB.A.-pB.M1WadB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/666
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/9476b1d1-47e4-ecfd-eb23-5b2fbc1410e3@virtuozzo.com
Resent-Date: Fri, 30 Aug 2019 18:39:08 +0000 (UTC)

MjMuMDguMjAxOSAxNzozNywgRXJpYyBCbGFrZSB3cm90ZToNCj4gQ29tbWl0IGZlMDQ4MGQ2IGFu
ZCBmcmllbmRzIGFkZGVkIEJEUlZfUkVRX05PX0ZBTExCQUNLIGFzIGEgd2F5IHRvDQo+IGF2b2lk
IHdhc3RpbmcgdGltZSBvbiBhIHByZWxpbWluYXJ5IHdyaXRlLXplcm8gcmVxdWVzdCB0aGF0IHdp
bGwgbGF0ZXINCj4gYmUgcmV3cml0dGVuIGJ5IGFjdHVhbCBkYXRhLCBpZiBpdCBpcyBrbm93biB0
aGF0IHRoZSB3cml0ZS16ZXJvDQo+IHJlcXVlc3Qgd2lsbCB1c2UgYSBzbG93IGZhbGxiYWNrOyBi
dXQgaW4gZG9pbmcgc28sIGNvdWxkIG5vdCBvcHRpbWl6ZQ0KPiBmb3IgTkJELiAgVGhlIE5CRCBz
cGVjaWZpY2F0aW9uIGlzIG5vdyBjb25zaWRlcmluZyBhbiBleHRlbnNpb24gdGhhdA0KPiB3aWxs
IGFsbG93IHBhc3Npbmcgb24gdGhvc2Ugc2VtYW50aWNzOyB0aGlzIHBhdGNoIHVwZGF0ZXMgdGhl
IG5ldw0KPiBwcm90b2NvbCBiaXRzIGFuZCAncWVtdS1uYmQgLS1saXN0JyBvdXRwdXQgdG8gcmVj
b2duaXplIHRoZSBiaXQsIGFzDQo+IHdlbGwgYXMgdGhlIG5ldyBlcnJubyB2YWx1ZSBwb3NzaWJs
ZSB3aGVuIHVzaW5nIHRoZSBuZXcgZmxhZzsgd2hpbGUNCj4gdXBjb21pbmcgcGF0Y2hlcyB3aWxs
IGltcHJvdmUgdGhlIGNsaWVudCB0byB1c2UgdGhlIGZlYXR1cmUgd2hlbg0KPiBwcmVzZW50LCBh
bmQgdGhlIHNlcnZlciB0byBhZHZlcnRpc2Ugc3VwcG9ydCBmb3IgaXQuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgZG9jcy9p
bnRlcm9wL25iZC50eHQgfCAzICsrLQ0KPiAgIGluY2x1ZGUvYmxvY2svbmJkLmggIHwgNCArKysr
DQo+ICAgbmJkL2NvbW1vbi5jICAgICAgICAgfCA1ICsrKysrDQo+ICAgbmJkL3NlcnZlci5jICAg
ICAgICAgfCAyICsrDQo+ICAgcWVtdS1uYmQuYyAgICAgICAgICAgfCAxICsNCj4gICA1IGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kb2NzL2ludGVyb3AvbmJkLnR4dCBiL2RvY3MvaW50ZXJvcC9uYmQudHh0DQo+IGluZGV4
IDZkZmVjN2Y0NzY0Ny4uNDUxMTg4MDk2MThlIDEwMDY0NA0KPiAtLS0gYS9kb2NzL2ludGVyb3Av
bmJkLnR4dA0KPiArKysgYi9kb2NzL2ludGVyb3AvbmJkLnR4dA0KPiBAQCAtNTMsNCArNTMsNSBA
QCB0aGUgb3BlcmF0aW9uIG9mIHRoYXQgZmVhdHVyZS4NCj4gICAqIDIuMTI6IE5CRF9DTURfQkxP
Q0tfU1RBVFVTIGZvciAiYmFzZTphbGxvY2F0aW9uIg0KPiAgICogMy4wOiBOQkRfT1BUX1NUQVJU
VExTIHdpdGggVExTIFByZS1TaGFyZWQgS2V5cyAoUFNLKSwNCj4gICBOQkRfQ01EX0JMT0NLX1NU
QVRVUyBmb3IgInFlbXU6ZGlydHktYml0bWFwOiIsIE5CRF9DTURfQ0FDSEUNCj4gLSogNC4yOiBO
QkRfRkxBR19DQU5fTVVMVElfQ09OTiBmb3Igc2hhcmFibGUgcmVhZC1vbmx5IGV4cG9ydHMNCj4g
KyogNC4yOiBOQkRfRkxBR19DQU5fTVVMVElfQ09OTiBmb3Igc2hhcmFibGUgcmVhZC1vbmx5IGV4
cG9ydHMsDQo+ICtOQkRfQ01EX0ZMQUdfRkFTVF9aRVJPDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2Jsb2NrL25iZC5oIGIvaW5jbHVkZS9ibG9jay9uYmQuaA0KPiBpbmRleCAyYzg3YjQyZGZkNDgu
LjIxNTUwNzQ3Y2YzNSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9ibG9jay9uYmQuaA0KPiArKysg
Yi9pbmNsdWRlL2Jsb2NrL25iZC5oDQo+IEBAIC0xNDAsNiArMTQwLDcgQEAgZW51bSB7DQo+ICAg
ICAgIE5CRF9GTEFHX0NBTl9NVUxUSV9DT05OX0JJVCAgICAgPSAgOCwgLyogTXVsdGktY2xpZW50
IGNhY2hlIGNvbnNpc3RlbnQgKi8NCj4gICAgICAgTkJEX0ZMQUdfU0VORF9SRVNJWkVfQklUICAg
ICAgICA9ICA5LCAvKiBTZW5kIHJlc2l6ZSAqLw0KPiAgICAgICBOQkRfRkxBR19TRU5EX0NBQ0hF
X0JJVCAgICAgICAgID0gMTAsIC8qIFNlbmQgQ0FDSEUgKHByZWZldGNoKSAqLw0KPiArICAgIE5C
RF9GTEFHX1NFTkRfRkFTVF9aRVJPX0JJVCAgICAgPSAxMSwgLyogRkFTVF9aRVJPIGZsYWcgZm9y
IFdSSVRFX1pFUk9FUyAqLw0KPiAgIH07DQo+IA0KPiAgICNkZWZpbmUgTkJEX0ZMQUdfSEFTX0ZM
QUdTICAgICAgICAgKDEgPDwgTkJEX0ZMQUdfSEFTX0ZMQUdTX0JJVCkNCj4gQEAgLTE1Myw2ICsx
NTQsNyBAQCBlbnVtIHsNCj4gICAjZGVmaW5lIE5CRF9GTEFHX0NBTl9NVUxUSV9DT05OICAgICgx
IDw8IE5CRF9GTEFHX0NBTl9NVUxUSV9DT05OX0JJVCkNCj4gICAjZGVmaW5lIE5CRF9GTEFHX1NF
TkRfUkVTSVpFICAgICAgICgxIDw8IE5CRF9GTEFHX1NFTkRfUkVTSVpFX0JJVCkNCj4gICAjZGVm
aW5lIE5CRF9GTEFHX1NFTkRfQ0FDSEUgICAgICAgICgxIDw8IE5CRF9GTEFHX1NFTkRfQ0FDSEVf
QklUKQ0KPiArI2RlZmluZSBOQkRfRkxBR19TRU5EX0ZBU1RfWkVSTyAgICAoMSA8PCBOQkRfRkxB
R19TRU5EX0ZBU1RfWkVST19CSVQpDQo+IA0KPiAgIC8qIE5ldy1zdHlsZSBoYW5kc2hha2UgKGds
b2JhbCkgZmxhZ3MsIHNlbnQgZnJvbSBzZXJ2ZXIgdG8gY2xpZW50LCBhbmQNCj4gICAgICBjb250
cm9sIHdoYXQgd2lsbCBoYXBwZW4gZHVyaW5nIGhhbmRzaGFrZSBwaGFzZS4gKi8NCj4gQEAgLTIw
NSw2ICsyMDcsNyBAQCBlbnVtIHsNCj4gICAjZGVmaW5lIE5CRF9DTURfRkxBR19ERiAgICAgICAg
ICgxIDw8IDIpIC8qIGRvbid0IGZyYWdtZW50IHN0cnVjdHVyZWQgcmVhZCAqLw0KPiAgICNkZWZp
bmUgTkJEX0NNRF9GTEFHX1JFUV9PTkUgICAgKDEgPDwgMykgLyogb25seSBvbmUgZXh0ZW50IGlu
IEJMT0NLX1NUQVRVUw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICogcmVwbHkgY2h1bmsgKi8NCj4gKyNkZWZpbmUgTkJEX0NNRF9GTEFHX0ZBU1RfWkVSTyAg
KDEgPDwgNCkgLyogZmFpbCBpZiBXUklURV9aRVJPRVMgaXMgbm90IGZhc3QgKi8NCj4gDQo+ICAg
LyogU3VwcG9ydGVkIHJlcXVlc3QgdHlwZXMgKi8NCj4gICBlbnVtIHsNCj4gQEAgLTI3MCw2ICsy
NzMsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgbmJkX3JlcGx5X3R5cGVfaXNfZXJyb3IoaW50IHR5
cGUpDQo+ICAgI2RlZmluZSBOQkRfRUlOVkFMICAgICAyMg0KPiAgICNkZWZpbmUgTkJEX0VOT1NQ
QyAgICAgMjgNCj4gICAjZGVmaW5lIE5CRF9FT1ZFUkZMT1cgIDc1DQo+ICsjZGVmaW5lIE5CRF9F
Tk9UU1VQICAgIDk1DQo+ICAgI2RlZmluZSBOQkRfRVNIVVRET1dOICAxMDgNCj4gDQo+ICAgLyog
RGV0YWlscyBjb2xsZWN0ZWQgYnkgTkJEX09QVF9FWFBPUlRfTkFNRSBhbmQgTkJEX09QVF9HTyAq
Lw0KPiBkaWZmIC0tZ2l0IGEvbmJkL2NvbW1vbi5jIGIvbmJkL2NvbW1vbi5jDQo+IGluZGV4IGNj
OGIyNzhlNTQxZC4uZGRmZTdkMTE4MzcxIDEwMDY0NA0KPiAtLS0gYS9uYmQvY29tbW9uLmMNCj4g
KysrIGIvbmJkL2NvbW1vbi5jDQo+IEBAIC0yMDEsNiArMjAxLDggQEAgY29uc3QgY2hhciAqbmJk
X2Vycl9sb29rdXAoaW50IGVycikNCj4gICAgICAgICAgIHJldHVybiAiRU5PU1BDIjsNCj4gICAg
ICAgY2FzZSBOQkRfRU9WRVJGTE9XOg0KPiAgICAgICAgICAgcmV0dXJuICJFT1ZFUkZMT1ciOw0K
PiArICAgIGNhc2UgTkJEX0VOT1RTVVA6DQo+ICsgICAgICAgIHJldHVybiAiRU5PVFNVUCI7DQo+
ICAgICAgIGNhc2UgTkJEX0VTSFVURE9XTjoNCj4gICAgICAgICAgIHJldHVybiAiRVNIVVRET1dO
IjsNCj4gICAgICAgZGVmYXVsdDoNCj4gQEAgLTIzMSw2ICsyMzMsOSBAQCBpbnQgbmJkX2Vycm5v
X3RvX3N5c3RlbV9lcnJubyhpbnQgZXJyKQ0KPiAgICAgICBjYXNlIE5CRF9FT1ZFUkZMT1c6DQo+
ICAgICAgICAgICByZXQgPSBFT1ZFUkZMT1c7DQo+ICAgICAgICAgICBicmVhazsNCj4gKyAgICBj
YXNlIE5CRF9FTk9UU1VQOg0KPiArICAgICAgICByZXQgPSBFTk9UU1VQOw0KPiArICAgICAgICBi
cmVhazsNCj4gICAgICAgY2FzZSBOQkRfRVNIVVRET1dOOg0KPiAgICAgICAgICAgcmV0ID0gRVNI
VVRET1dOOw0KPiAgICAgICAgICAgYnJlYWs7DQo+IGRpZmYgLS1naXQgYS9uYmQvc2VydmVyLmMg
Yi9uYmQvc2VydmVyLmMNCj4gaW5kZXggYjU1Nzc4MjhhYTQ0Li45ODFiYzNjYjExNTEgMTAwNjQ0
DQo+IC0tLSBhL25iZC9zZXJ2ZXIuYw0KPiArKysgYi9uYmQvc2VydmVyLmMNCj4gQEAgLTU1LDYg
KzU1LDggQEAgc3RhdGljIGludCBzeXN0ZW1fZXJybm9fdG9fbmJkX2Vycm5vKGludCBlcnIpDQo+
ICAgICAgICAgICByZXR1cm4gTkJEX0VOT1NQQzsNCj4gICAgICAgY2FzZSBFT1ZFUkZMT1c6DQo+
ICAgICAgICAgICByZXR1cm4gTkJEX0VPVkVSRkxPVzsNCj4gKyAgICBjYXNlIEVOT1RTVVA6DQo+
ICsgICAgICAgIHJldHVybiBOQkRfRU5PVFNVUDsNCg0KVGhpcyBtYXkgcHJvdm9rZSByZXR1cm5p
bmcgTkJEX0VOT1RTVVAgaW4gb3RoZXIgY2FzZXMsIG5vdCBvbmx5IG5ldyBvbmUgd2UgYXJlIGdv
aW5nIHRvIGFkZC4NCg0KPiAgICAgICBjYXNlIEVTSFVURE9XTjoNCj4gICAgICAgICAgIHJldHVy
biBOQkRfRVNIVVRET1dOOw0KPiAgICAgICBjYXNlIEVJTlZBTDoNCj4gZGlmZiAtLWdpdCBhL3Fl
bXUtbmJkLmMgYi9xZW11LW5iZC5jDQo+IGluZGV4IDA3OTcwMmJiODM3Zi4uZGNlNTJmNTY0YjVh
IDEwMDY0NA0KPiAtLS0gYS9xZW11LW5iZC5jDQo+ICsrKyBiL3FlbXUtbmJkLmMNCj4gQEAgLTI5
NCw2ICsyOTQsNyBAQCBzdGF0aWMgaW50IHFlbXVfbmJkX2NsaWVudF9saXN0KFNvY2tldEFkZHJl
c3MgKnNhZGRyLCBRQ3J5cHRvVExTQ3JlZHMgKnRscywNCj4gICAgICAgICAgICAgICAgICAgW05C
RF9GTEFHX0NBTl9NVUxUSV9DT05OX0JJVF0gICAgICAgPSAibXVsdGkiLA0KPiAgICAgICAgICAg
ICAgICAgICBbTkJEX0ZMQUdfU0VORF9SRVNJWkVfQklUXSAgICAgICAgICA9ICJyZXNpemUiLA0K
PiAgICAgICAgICAgICAgICAgICBbTkJEX0ZMQUdfU0VORF9DQUNIRV9CSVRdICAgICAgICAgICA9
ICJjYWNoZSIsDQo+ICsgICAgICAgICAgICAgICAgW05CRF9GTEFHX1NFTkRfRkFTVF9aRVJPX0JJ
VF0gICAgICAgPSAiZmFzdC16ZXJvIiwNCj4gICAgICAgICAgICAgICB9Ow0KPiANCj4gICAgICAg
ICAgICAgICBwcmludGYoIiAgc2l6ZTogICUiIFBSSXU2NCAiXG4iLCBsaXN0W2ldLnNpemUpOw0K
PiANCg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQo=

