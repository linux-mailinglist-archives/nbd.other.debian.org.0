Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B6AC89A
	for <lists+nbd@lfdr.de>; Sat,  7 Sep 2019 19:57:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F6C02050C; Sat,  7 Sep 2019 17:57:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep  7 17:57:15 2019
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,THREADTOPIC autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4245920520
	for <lists-other-nbd@bendel.debian.org>; Sat,  7 Sep 2019 17:41:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6uNhmX845LgG for <lists-other-nbd@bendel.debian.org>;
	Sat,  7 Sep 2019 17:41:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -1.25
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40121.outbound.protection.outlook.com [40.107.4.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4084A2051E
	for <nbd@other.debian.org>; Sat,  7 Sep 2019 17:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCNAboHiAvKAoHZQkWbOE9rlF3S5Inqey+N3Jcz/yFtYCRx+SyEVoD339SLzrHNNAQ5dKtocaG0LT+gvaMuzyBNXCHYdf/jtVubGEY+gNPY5tVQBeeyBIaI7u8Ab2QeDQKj3LIDVTijpGTxmxgw8ZE59jz5QhOgDYjgSnSQcH1Y+l58XK0WbQbh1n20TUgFOFgrxmZmVcPedGP5X2rUN9rbVJazngclzCeNO/Kd7CLlBXQSwUFuFiUsAdaEQFjfEUoTwUk7jEc3MnP7Qmc/UN94idLrZAJwVgJjYCtkpmoGdJz5KposWwmbAruNcgUOIjQa/uJTF7NuV+josUCSxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P5swp7fbF8CDD39olk0Sc04WW7pb5c3ILsuNydTr6g=;
 b=Hf8fq6agyMMSXVMknig6VGnYqeIraUKRSSH/0Rn51Q7l0Z0LEBTjzGNs9CW+udf8CtPytuC8pcBO/VHsy91ahhQEhndzweACiVJ3+FGLz0D4REWwfhkU2dyTb7sRn+3GknVPOx3fVauGbJjw1inajeovE+OEQN6uNanvN1uapNcD7rbAefuKzWqW6mKnzmydizsgNaPB/QF0T5Qrnyob8gdLPDwgXlOp551BWdwrlJSgccGZ+t9RL16U6yelxeHTGKElB7qXVjb6u1IlWriGIsaLeXVztOzHirYMlCOGuG1M2QssujKhYLQIKdYxWhog65XADkrMMLm/O7Q154inyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P5swp7fbF8CDD39olk0Sc04WW7pb5c3ILsuNydTr6g=;
 b=mdvMb5kaWUiYNbPtd4UnIpeAKhEO+IEpZwc9pP1Itir/tWCpKkxD7N36eJwjko19LMsHd+pnDFJO9uu+J5KL5HEMIdDJq6F3Ro/UEmKXIhOPOc/B+yAn/NmH7ArqrcZ5d9dwm9Jgc91WG8KrvxtYxOtkWPxmrVMB0Q0laHLVjD8=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB4970.eurprd08.prod.outlook.com (10.255.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sat, 7 Sep 2019 17:26:03 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2241.018; Sat, 7 Sep 2019
 17:26:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "nbd@other.debian.org"
	<nbd@other.debian.org>
CC: Denis Lunev <den@virtuozzo.com>
Subject: Re: [PATCH v4] doc: Add alternate trim/zero limits
Thread-Topic: [PATCH v4] doc: Add alternate trim/zero limits
Thread-Index: AQHT4ZKN4cceTYqGGkyH+93888tYpaUNBu4AgAAFOICCFnNWAA==
Date: Sat, 7 Sep 2019 17:26:03 +0000
Message-ID: <5de902a3-bbe3-4415-8238-57d0f8e75371@virtuozzo.com>
References: <20180501212242.986796-1-eblake@redhat.com>
 <bbf265a8-3380-e153-1fa3-3a7c9048692a@virtuozzo.com>
 <272b17ce-9247-e751-b85f-9eda492c3853@redhat.com>
In-Reply-To: <272b17ce-9247-e751-b85f-9eda492c3853@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR0401CA0048.eurprd04.prod.outlook.com
 (2603:10a6:3:19::16) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190907202600814
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 280c5bbf-37c9-4739-eabf-08d733b87563
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB4970;
x-ms-traffictypediagnostic: DB8PR08MB4970:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <DB8PR08MB4970DFE4F8D68C3CCB4A1AD2C1B50@DB8PR08MB4970.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0153A8321A
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(346002)(39840400004)(366004)(136003)(376002)(396003)(52314003)(199004)(51444003)(189003)(446003)(26005)(386003)(6506007)(102836004)(53546011)(4326008)(110136005)(229853002)(76176011)(256004)(2616005)(81156014)(11346002)(25786009)(316002)(52116002)(6436002)(14444005)(6512007)(107886003)(6246003)(81166006)(478600001)(8676002)(6486002)(3846002)(476003)(486006)(6116002)(186003)(2906002)(7736002)(99286004)(53936002)(71190400001)(305945005)(71200400001)(2501003)(8936002)(14454004)(31696002)(5660300002)(64756008)(66066001)(66556008)(66476007)(36756003)(66946007)(31686004)(66446008)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB4970;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 mhvBJ7901AN9fuXNPtrpl57FzSlPque4HznsIF9VWvSQXD6/kOYzaSFgNKpk1f+e4i8vV7S0OI05GWLOm7xB0++iD9/MkAUDqMIhcN4PYQk2iOl1w6i8zCSN+Un8mZ91FQyAJnpDBCmWWOw4yxkX8J3WehsUYUzQyeswylllCbn58NHDsTKCGMQlb7O8hUp23O1kmgX8x7m1+P6ycqCR6ldWQUfGhFt0B/CY16IiZ0KfDLJNXoZHeaj13ytpdotxhVqSTcGtqY98w+pxVxhDakLiZDdfA17vA2O4E0B4N35yD0wBd6vAw698u1rAXFOeAYDo9eqAE02/hoxa2B9fAp10ih6vFn/cuW6SihRKYFEb5ItisSqRct5/Sdlu7dZRMXKn/gylJOeuUrvNBgl2tnJJDDPpfENK5V5L63xPRA4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10D1577475537448840196D87B1606DC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280c5bbf-37c9-4739-eabf-08d733b87563
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2019 17:26:03.5177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAkQbnDFiH0YH9efOkue5Bwv1w56kUEamejLo6K/l3xEXdlklP2VEujlPMHkNEJaTwK+Nx3U9G0ywPLn0GDEwAIsr+PxDsTOIzXqKlCT2wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4970
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eOuhukSdppD.A.qjF.79-cdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/686
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5de902a3-bbe3-4415-8238-57d0f8e75371@virtuozzo.com
Resent-Date: Sat,  7 Sep 2019 17:57:15 +0000 (UTC)

MDIuMTAuMjAxOCAxODo1MCwgRXJpYyBCbGFrZSB3cm90ZToNCj4gT24gMTAvMi8xOCAxMDozMSBB
TSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4+IEhtbSwgRXJpYywgd2hh
dCBhcmUgdGhlIHBsYW5zIGFib3V0IHRoaXM/DQo+Pg0KPj4gTm93IGluIHVwc3RyZWFtIGRpc2Nh
cmQsIHdyaXRlLXplcm9zIGFuZCBibG9jay1zdGF0dXMgYXJlIGxpbWl0ZWQgaW4NCj4+IGNsaWVu
dCB0byAzMm0gYnkgZGVmYXVsdCB3aGljaCBpcyB0b28gc2xvdy4NCj4+IENhbiB3ZSBtYWtlIHNv
bWUgbWluaW1hbCBzcGVjaWZpY2F0aW9uIGNoYW5nZSB0byBkcm9wIHRoZXNlIHN0cmljdA0KPj4g
bGltaXRhdGlvbnM/DQo+IA0KPiBFbHNld2hlcmUgaW4gdGhlIHRocmVhZCwgYmFjayBpbiBNYXk6
DQo+IA0KPj4+PiBTbywgbm93IHdlIGhhdmUgdHdvIHZlcnkgc2ltaWxhciBvcHRpb25zLCBhbmQg
aW4gcmVhbGl6YXRpb24gLSB0d28gYWxtb3N0IGlkZW50aWNhbCBjb2RlIHBhdGhzLg0KPj4+PiBB
cmUgd2UgZ29pbmcgdG8gYWRkIHNpbWlsYXIgbGltaXRzIGZvciBCTE9DS19TVEFUVVM/IGFuZCBm
b3IgQ0FDSEU/IEkgaGF2ZSBhbiBpZGVhOiB3aGF0IGFib3V0IHNvbWUga2luZCBvZiB1bml2ZXJz
YWwgb3B0aW9uIGZvciBpdD8gU29tZXRoaW5nIGxpa2UNCj4+Pj4NCj4+Pj4gb3B0aW9uIElORk9f
Q01EX1NJWkU6IHNwZWNpZmljIGxpbWl0cyBmb3IgY29tbWFuZDoNCj4+Pj4gwqDCoCB1aW50MTZf
dCBjb21tYW5kDQo+Pj4+IMKgwqAgdWludDMyX3QgbWluX2Jsb2NrDQo+Pj4+IMKgwqAgdWludDMy
X3QgbWF4X2Jsb2NrDQo+Pj4+DQo+Pj4+IGFuZCBzZXJ2ZXIgY2FuIHNlbmQgc2V2ZXJhbCBzdWNo
IG9wdGlvbnMsIGNsaWVudCBjYW4gcmVxdWVzdCB0aGVtIGluIHNvbWUgZ2VuZXJpYyB3YXkuIE1v
c3Qgb2Ygc2VtYW50aWNzIGZvciB0aGVzZSBhZGRpdGlvbmFsIGxpbWl0cyBhcmUgY29tbW9uLCBz
byBpdCB3aWxsIHNpbXBsaWZ5IGJvdGggZG9jdW1lbnRhdGlvbiBhbmQgcmVhbGl6YXRpb24uDQo+
Pj4+DQo+Pj4NCj4+PiBXZSBhbHJlYWR5IGRvY3VtZW50ICJBIHBhcnRpY3VsYXIgaW5mb3JtYXRp
b24gdHlwZSBTSE9VTEQgb25seSBhcHBlYXIgb25jZSBmb3IgYSBnaXZlbiBleHBvcnQgdW5sZXNz
IGRvY3VtZW50ZWQgb3RoZXJ3aXNlLiIgLSBidXQgdGhpcyB3b3VsZCBpbmRlZWQgYmUgYSBjYXNl
IHdoZXJlIHdlIGNvdWxkIGRvY3VtZW50IG90aGVyd2lzZS4NCj4+Pg0KPj4+IERvIHlvdSBlbnZp
c2lvbiBhIHNlcnZlciB0aGF0IG5lZWRzIHRvIGhhdmUgaW5kZXBlbmRlbnQgbGltaXRzIGZvciBD
QUNIRSBhbmQvb3IgQkxPQ0tfU1RBVFVTIGJleW9uZCB0aGUgdXN1YWwgbGltaXRzIGZvciBSRUFE
LCB3aGVyZSBhZHZlcnRpc2luZyBhbHRlcm5hdGl2ZSBsaW1pdHMgaXMgd29ydGh3aGlsZT/CoCBC
dXQgdGhlIGlkZWEgb2YgaGF2aW5nIGEgc2luZ2xlIHJldXNhYmxlIGluZm8gdGhhdCBkb2N1bWVu
dHMgcGVyLWNvbW1hbmQgbGltaXRzIG1heSBiZSB3b3J0aCB0aGUgZWZmb3J0LCBzbyBJJ2xsIHRy
eSBhIHY1IG9mIGJvdGggdGhpcyBwYXRjaCBhbmQgb2YgdGhlIHFlbXUgcHJvb2Ytb2YtY29uY2Vw
dCBpbXBsZW1lbnRhdGlvbiBhbG9uZyB0aG9zZSBsaW5lcywgc28gdGhhdCB3ZSBjYW4gY29tcGFy
ZSB0aGUgdHdvIGFwcHJvYWNoZXMuIA0KPiANCj4gSXQncyBzdGlsbCBvbiBteSB0b2RvIGxpc3Qg
dG8gcHJvcG9zZSBhbiBhbHRlcm5hdGl2ZSB3b3JkaW5nIGFsb25nIHdpdGggYSBxZW11IGltcGxl
bWVudGF0aW9uLCBmb3IgdGhlIHY1IHBvc3Rpbmcgb2YgdGhpcyB0b3BpYy7CoCBIb3dldmVyLCBp
dCBsaWtlbHkgd29uJ3QgaGFwcGVuIHVudGlsIGFmdGVyIEtWTSBGb3J1bSBsYXRlciB0aGlzIG1v
bnRoLg0KPiANCg0KSGkhDQoNCkludmVzdGlnYXRpbmcgb3VyIGhlYXAgb2YgcGF0Y2hlcyBpbiB2
aXJ0dW96em8gcWVtdSBhYm92ZSByaGVsIHFlbXUsIEkgbm93IGxvb2sgYXQgdHdvIHBhdGNoZXMg
d2hpY2ggYWN0dWFsbHkgZHJvcCB0aGVzZSByZXN0cmljdGlvbnMNCmluIGNsaWVudCBmb3IgV1JJ
VEVfWkVSTywgVFJJTSBhbmQgQkxPQ0tfU1RBVFVTLiBTbyBhY3R1YWxseSB3ZSBqdXN0IGxpdmUg
d2l0aCBhIGJpdCBub24tY29tcGxpYW50IGNsaWVudCBmb3IgbW9yZSB0aGFuIHllYXIgZHVlIHRv
DQp0aGVzZSByZXN0cmljdGlvbnMuLg0KDQpJIGRpZG4ndCBhbnN3ZXIgeW91ciBxdWVzdGlvbiBh
Ym91dCBCTE9DS19TVEFUVVM6IHllcywgd2UgbmVlZCBsYXJnZSBCTE9DS19TVEFTVFVTIHJlcXVl
c3RzLCBhcyBxZW11LWltZyBjb252ZXJ0IGRvZXMgYWRkaXRpb25hbCBsb29wDQpvZiBibG9jayBz
dGF0dXMgcXVlcnlpbmcgYmVmb3JlIGFjdHVhbCBjb252ZXJ0aW5nLCBhbmQgdGhpcyBsb29wIGlz
IHNsb3dlZCBkb3duIGJlY2F1c2Ugb2YgcmVzdHJpY3Rpb25zLiBBYm91dCBDQUNIRSBJJ20gdW5z
dXJlLCBzZWVtcw0Kd2UgZGlkbid0IGZhY2Ugc3VjaCBwcm9ibGVtcyB3aXRoIGl0Lg0KDQpEbyB5
b3UgaGF2ZSBwbGFucyBvciBpZGVhcyBvbiB0aGlzIHRvcGljPw0KDQpJIHRoaW5rIHRoYXQgZm9y
IEJMT0NLX1NUQVRVUyBhbmQgVFJJTSB3ZSBjYW4gc2FmZWx5IGRyb3AgbWF4X2Jsb2NrIHJlc3Ry
aWN0aW9uIGF0IGFsbCwgZG9jdW1lbnRpbmcgdGhhdCBtYXhfYmxvY2sgaXMgdW5yZWxhdGVkIHRv
DQp0aGVzZSBjb21tYW5kcywgYXMgYWN0dWFsbHksIGZvciBCTE9DS19TVEFUVVMgc2VydmVyIG1h
eSByZXR1cm4gbGVzcyB0aGVuIHJlcXVpcmVkIGFueXdheSwgYW5kIFRSSU0gc2hvdWxkIG5ldmVy
IGxlYWQgdG8gc29tZSBiaWcNCmFsbG9jYXRpb25zIG9yIGNhbGN1bGF0aW9ucy4uDQoNCldSSVRF
X1pFUk8gaXMgYSBiaXQgdHJpY2tpZXIsIGFzIGlmIGl0IGlzIGJhY2tlZCBieSBqdXN0IHdyaXRp
bmcgemVyb2VzLCBidXQgd2UgY2FuIGF0IGxlYXN0IGRyb3AgbWF4X2Jsb2NrIHJlc3RyaWN0aW9u
IGlmIEZBU1RfWkVSTw0KZmxhZyBpcyBzcGVjaWZpZWQsIHRoYW4gY2xpZW50IG1heSBpbXBsZW1l
bnQgd3JpdGUgemVybyBhcw0KDQp3cml0ZV96ZXJvKEZBU1RfWkVSTykNCmlmIGZhaWxlZDoNCiAg
ICB3cml0aW5nIHplcm8gaXMgc2xvdyBhbnl3YXksIGRvIGl0IGluIGEgbG9vcC4NCg0KDQpTbywg
aW4gb3RoZXIgd29yZHMsIGNhbiB3ZSBkbyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQogIGRpZmYg
LS1naXQgYS9kb2MvcHJvdG8ubWQgYi9kb2MvcHJvdG8ubWQNCiAgaW5kZXggZmM3YmFmNi4uNGIw
NjdmNSAxMDA2NDQNCiAgLS0tIGEvZG9jL3Byb3RvLm1kDQogICsrKyBiL2RvYy9wcm90by5tZA0K
ICBAQCAtODE1LDkgKzgxNSwxMiBAQCBXaGVyZSBhIHRyYW5zbWlzc2lvbiByZXF1ZXN0IGNhbiBo
YXZlIGEgbm9uemVybyAqb2Zmc2V0KiBhbmQvb3INCiAgIHRoZSBjbGllbnQgTVVTVCBlbnN1cmUg
dGhhdCAqb2Zmc2V0KiBhbmQgKmxlbmd0aCogYXJlIGludGVnZXINCiAgIG11bHRpcGxlcyBvZiBh
bnkgYWR2ZXJ0aXNlZCBtaW5pbXVtIGJsb2NrIHNpemUsIGFuZCBTSE9VTEQgdXNlIGludGVnZXIN
CiAgIG11bHRpcGxlcyBvZiBhbnkgYWR2ZXJ0aXNlZCBwcmVmZXJyZWQgYmxvY2sgc2l6ZSB3aGVy
ZSBwb3NzaWJsZS4gIEZvcg0KICAtdGhvc2UgcmVxdWVzdHMsIHRoZSBjbGllbnQgTVVTVCBOT1Qg
dXNlIGEgKmxlbmd0aCogbGFyZ2VyIHRoYW4gYW55DQogIC1hZHZlcnRpc2VkIG1heGltdW0gYmxv
Y2sgc2l6ZSBvciB3aGljaCwgd2hlbiBhZGRlZCB0byAqb2Zmc2V0Kiwgd291bGQNCiAgLWV4Y2Vl
ZCB0aGUgZXhwb3J0IHNpemUuICBUaGUgc2VydmVyIFNIT1VMRCByZXBvcnQgYW4gYE5CRF9FSU5W
QUxgIGVycm9yIGlmDQogICt0aG9zZSByZXF1ZXN0cywgdGhlIGNsaWVudCBNVVNUIE5PVCB1c2Ug
YSAqbGVuZ3RoKiB3aGljaCwgd2hlbiBhZGRlZCB0bw0KICArKm9mZnNldCosIHdvdWxkIGV4Y2Vl
ZCB0aGUgZXhwb3J0IHNpemUuIEFsc28gZm9yIE5CRF9DTURfUkVBRCwNCiAgK05CRF9DTURfV1JJ
VEUsIE5CRF9DTURfQ0FDSEUgYW5kIE5CRF9DTURfV1JJVEVfWkVST0VTIChleGNlcHQgZm9yDQog
ICt3aGVuIE5CRF9DTURfRkxBR19GQVNUX1pFUk8gaXMgc2V0KSwgdGhlIGNsaWVudCBNVVNUIE5P
VCB1c2UgYSAqbGVuZ3RoKg0KICArbGFyZ2VyIHRoYW4gYW55IGFkdmVydGlzZWQgbWF4aW11bSBi
bG9jayBzaXplLg0KICArVGhlIHNlcnZlciBTSE9VTEQgcmVwb3J0IGFuIGBOQkRfRUlOVkFMYCBl
cnJvciBpZg0KICAgdGhlIGNsaWVudCdzIHJlcXVlc3QgaXMgbm90IGFsaWduZWQgdG8gYWR2ZXJ0
aXNlZCBtaW5pbXVtIGJsb2NrIHNpemUNCiAgIGJvdW5kYXJpZXMsIG9yIGlzIGxhcmdlciB0aGFu
IHRoZSBhZHZlcnRpc2VkIG1heGltdW0gYmxvY2sgc2l6ZS4NCiAgIE5vdHdpdGhzdGFuZGluZyBh
bnkgbWF4aW11bSBibG9jayBzaXplIGFkdmVydGlzZWQsIGVpdGhlciB0aGUgc2VydmVyDQoNCj8N
Cg0KT3IgaXQgd2lsbCBtYWtlIGV4aXN0ZW50IG5iZCBzZXJ2ZXJzIG5vbi1jb21wbGlhbnQ/IEF0
IGxlYXN0IHNlZW1zIHFlbXUgbmJkIHNlcnZlciBuZXZlciBmb3JjZWQgdGhlc2UgcmVzdHJpY3Rp
b25zDQppbiBzcGVjaWZpZWQgY2FzZXMuDQoNCg0KQW5kLCBhZGRpdGlvbmFsIGlkZWE6IGNhbiB3
ZSBpbiBxZW11IGp1c3QgaWdub3JlIHRoZXNlIHJlc3RyaWN0aW9ucyB1cCB0byBmaXJzdCBFSU5W
QUwgcmV0dXJuZWQ/IFNvLCBmb3IgZXhhbXBsZSwNCndlIHN0YXJ0IHdpdGggYnMtPmJsLm1heF9w
d3JpdGVfemVyb2VzID0gSU5UX01BWCwgd2Ugc2VuZCBXUklURV9aRVJPRVMgd2l0aCBsZW5ndGgg
ZXhjZWVkaW5nIG1heF9ibG9jaywgaWYgc2VydmVyDQpyZXBsaWVzIHdpdGggRUlOVkFMIHdlIHJl
dHJ5IGN1cnJlbnQgcmVxdWVzdCB1c2luZyBsaW1pdGVkIGxlbmd0aCAod2UgaGF2ZSB0byBkbyBp
dCBpbiBhIGxvb3ApIGFuZCBzZXQNCmJzLT5ibC5tYXhfcHdyaXRlX3plcm9lcyA9IG1heF9ibG9j
ay4NCg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQo=

