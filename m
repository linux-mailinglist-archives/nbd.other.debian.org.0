Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C4A434A
	for <lists+nbd@lfdr.de>; Sat, 31 Aug 2019 10:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AC67220497; Sat, 31 Aug 2019 08:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 31 08:27:09 2019
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
	by bendel.debian.org (Postfix) with ESMTP id C5A602046F
	for <lists-other-nbd@bendel.debian.org>; Sat, 31 Aug 2019 08:11:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M49q-9gkxlV3 for <lists-other-nbd@bendel.debian.org>;
	Sat, 31 Aug 2019 08:11:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur03-am5-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on0710.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe08::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 308222043F
	for <nbd@other.debian.org>; Sat, 31 Aug 2019 08:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONwygeJpcYQUcehwUmU9rPTK6GFkDrClpkJxlMaB4iDUSWyUtIkJbSwt/cmI27+jcy4yXKjznVRt8VWW4Kv+0leYZZrl2FrCj7g1oGv5OG5WTPwWvK9iyTxwLRcXBdI6Fzin7YH5wbAnKWxdn4qPg9ZMLEvngeZM4m3qNb4o+L2b/ahTYiMJKmcxyRnSC2lD5hS3GJVf7O7W0fDQaRKHaaOsJbz56AdoMNAmLmgTj/QVyOFFzQysImuJ4dguJQArLPIZpriIcTD/D+yOYhwgMdlG+DrM8f+nyAnyovocZsxAvm2eSPOqwC7rRtR9uNEsvdSdku554c2lZtpoTxL3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQTLidQXu6QZyAlTqjAUaThMA5ymiFH2Df+1Ynb5CCI=;
 b=mzEvnRD9xxTG6XhcBkEaq5KL1DvybKzMhx6QWBL7nCZNJCkmAOvqdshGuy7qHMyNbkQZHQeuPMjKogE5Au0ew+50bgxnpz0ovM62QzSzsQtqgdvRei46xhKnNCs94Ae3l+ZSK1pMnCHzB0A4wVOmPQHx+CNfsISC8aSE0VEgc9mgGoo+tCzToFXih2CHvT9kXHvRKtkEtcf71AzAN4+6PLwh+l9x+Vaf7M5yyt/y+YJFZQMR6GcjUnYas5D+HVPsGYaH1WuuT81krgqoy6pOoChUYcD+KhfkESNbAPOLqpG9nCvrG+j0U2FAGnURNm6IqEfkzCGZ6T/yZyCFs/2zjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQTLidQXu6QZyAlTqjAUaThMA5ymiFH2Df+1Ynb5CCI=;
 b=EV1iItXm+sYzS+iKYOWrLxK02Dn8WjpTyV/ZQ9Jpei/hiVZVlSoFgHEj2Ssz6aH7WvpoWLoyIKEEgpG0CpQLYt8eVWc69r1SXgoq0ECbujLBrNeD+6NIlkdOhH1xwMwSZBinbCj3kPmGd7CsL1Nw24ar785caz4hNqoonaTEji4=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB4154.eurprd08.prod.outlook.com (20.179.12.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Sat, 31 Aug 2019 08:11:45 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2220.020; Sat, 31 Aug 2019
 08:11:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "open
 list:Network Block Dev..." <qemu-block@nongnu.org>, "libguestfs@redhat.com"
	<libguestfs@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>
Subject: Re: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
Thread-Topic: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
Thread-Index: AQHVWcJnZgUz/ZiSEEiPmfDFNqlCh6cUCAIAgABcQACAAI+qAA==
Date: Sat, 31 Aug 2019 08:11:45 +0000
Message-ID: <c56103bc-cf94-1585-8ffa-aa2efbc5bba8@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-3-eblake@redhat.com>
 <9476b1d1-47e4-ecfd-eb23-5b2fbc1410e3@virtuozzo.com>
 <911ecfee-675a-da91-19ec-dd11d6d21e78@redhat.com>
In-Reply-To: <911ecfee-675a-da91-19ec-dd11d6d21e78@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:7:67::21) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190831111142413
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe6a4520-6279-4457-9567-08d72deadce4
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB4154;
x-ms-traffictypediagnostic: DB8PR08MB4154:
x-microsoft-antispam-prvs:
 <DB8PR08MB41543D948A05F174BE91A464C1BC0@DB8PR08MB4154.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 014617085B
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(39840400004)(396003)(136003)(346002)(376002)(366004)(52314003)(199004)(189003)(2501003)(478600001)(66446008)(52116002)(66066001)(186003)(71200400001)(71190400001)(102836004)(3846002)(2616005)(14454004)(26005)(76176011)(446003)(6486002)(11346002)(486006)(2906002)(476003)(229853002)(110136005)(4326008)(6246003)(7736002)(316002)(54906003)(8936002)(64756008)(6116002)(305945005)(66556008)(25786009)(36756003)(31686004)(81156014)(6506007)(53546011)(86362001)(5660300002)(14444005)(6512007)(386003)(256004)(31696002)(99286004)(8676002)(6436002)(81166006)(66946007)(66476007)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB4154;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 qGTkgcKSEKXkjoObLwmFsFKlDvgYrvyfSr+osfYsTM+NbbTjOWd2PbRfsB5ZyKzxQaI0jnFT7sUe7mR9RR+RCCjS6mf5CpUERdJUphi/zrWnP3yUyVHwFxrIr8axJoxzWqZOrq60a0LsLplZl3g76zX5QbusMSP0tIsmegMMRELn4ypELfKQ/B74tSHDeaT7oQr0AkIhkKS7Z20T8kCzhU3XIIkMZ6qALbBbXCxxkCSdFnzOLC/OXGF4zykVv3tKpbQKvGP2zYZ5uEfd68VfiUbCcq5cxEJiuy/CaS35r1AMoa7fFUCsfraRHv069P3XtHjTxZS4myDVBdOeNFhTE7g6XdwPqsq/sUr5MYk4scSvzW/D3ZllNraxmoHq/F8N1pD97aRAdNyIGQBhNprKavO6c9UT3esc2Xh8rY+R7co=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F419A915487F1E4091182EF1A137FE43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6a4520-6279-4457-9567-08d72deadce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 08:11:45.1302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fjDLHC8DfDjJ1UshNPRtIrrIDR/PNcNNUDYT/NwP5BUhzfmPub5mNoF/BINAHw2IFlWSVQRRiR/PYuptPwxRc7k3dkh0W+2LwAVEkK+mtkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4154
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-VM0ZkT6hoD.A.0uE.d9iadB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/673
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c56103bc-cf94-1585-8ffa-aa2efbc5bba8@virtuozzo.com
Resent-Date: Sat, 31 Aug 2019 08:27:09 +0000 (UTC)

MzEuMDguMjAxOSAyOjM3LCBFcmljIEJsYWtlIHdyb3RlOg0KPiBPbiA4LzMwLzE5IDE6MDcgUE0s
IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgd3JvdGU6DQo+PiAyMy4wOC4yMDE5IDE3OjM3
LCBFcmljIEJsYWtlIHdyb3RlOg0KPj4+IENvbW1pdCBmZTA0ODBkNiBhbmQgZnJpZW5kcyBhZGRl
ZCBCRFJWX1JFUV9OT19GQUxMQkFDSyBhcyBhIHdheSB0bw0KPj4+IGF2b2lkIHdhc3RpbmcgdGlt
ZSBvbiBhIHByZWxpbWluYXJ5IHdyaXRlLXplcm8gcmVxdWVzdCB0aGF0IHdpbGwgbGF0ZXINCj4+
PiBiZSByZXdyaXR0ZW4gYnkgYWN0dWFsIGRhdGEsIGlmIGl0IGlzIGtub3duIHRoYXQgdGhlIHdy
aXRlLXplcm8NCj4+PiByZXF1ZXN0IHdpbGwgdXNlIGEgc2xvdyBmYWxsYmFjazsgYnV0IGluIGRv
aW5nIHNvLCBjb3VsZCBub3Qgb3B0aW1pemUNCj4+PiBmb3IgTkJELiAgVGhlIE5CRCBzcGVjaWZp
Y2F0aW9uIGlzIG5vdyBjb25zaWRlcmluZyBhbiBleHRlbnNpb24gdGhhdA0KPj4+IHdpbGwgYWxs
b3cgcGFzc2luZyBvbiB0aG9zZSBzZW1hbnRpY3M7IHRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgbmV3
DQo+Pj4gcHJvdG9jb2wgYml0cyBhbmQgJ3FlbXUtbmJkIC0tbGlzdCcgb3V0cHV0IHRvIHJlY29n
bml6ZSB0aGUgYml0LCBhcw0KPj4+IHdlbGwgYXMgdGhlIG5ldyBlcnJubyB2YWx1ZSBwb3NzaWJs
ZSB3aGVuIHVzaW5nIHRoZSBuZXcgZmxhZzsgd2hpbGUNCj4+PiB1cGNvbWluZyBwYXRjaGVzIHdp
bGwgaW1wcm92ZSB0aGUgY2xpZW50IHRvIHVzZSB0aGUgZmVhdHVyZSB3aGVuDQo+Pj4gcHJlc2Vu
dCwgYW5kIHRoZSBzZXJ2ZXIgdG8gYWR2ZXJ0aXNlIHN1cHBvcnQgZm9yIGl0Lg0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+DQo+IA0KPj4+ICsr
KyBiL25iZC9zZXJ2ZXIuYw0KPj4+IEBAIC01NSw2ICs1NSw4IEBAIHN0YXRpYyBpbnQgc3lzdGVt
X2Vycm5vX3RvX25iZF9lcnJubyhpbnQgZXJyKQ0KPj4+ICAgICAgICAgICAgcmV0dXJuIE5CRF9F
Tk9TUEM7DQo+Pj4gICAgICAgIGNhc2UgRU9WRVJGTE9XOg0KPj4+ICAgICAgICAgICAgcmV0dXJu
IE5CRF9FT1ZFUkZMT1c7DQo+Pj4gKyAgICBjYXNlIEVOT1RTVVA6DQo+Pj4gKyAgICAgICAgcmV0
dXJuIE5CRF9FTk9UU1VQOw0KPj4NCj4+IFRoaXMgbWF5IHByb3Zva2UgcmV0dXJuaW5nIE5CRF9F
Tk9UU1VQIGluIG90aGVyIGNhc2VzLCBub3Qgb25seSBuZXcgb25lIHdlIGFyZSBnb2luZyB0byBh
ZGQuDQo+IA0KPiBDb3JyZWN0LiBCdXQgdGhlIHNwZWMgb25seSBzYWlkIFNIT1VMRCBhdm9pZCBF
Tk9UU1VQIGluIHRob3NlIG90aGVyDQo+IGNhc2VzLCBub3QgTVVTVCBhdm9pZCBFTk9UU1VQOyBh
bmQgaW4gcHJhY3RpY2UsIGVpdGhlciB0aGUgY2xpZW50IHRoYXQNCj4gaXMgbm90IHN1c3BlY3Rp
bmcgaXQgd2lsbCB0cmVhdCBpdCB0aGUgc2FtZSBhcyBOQkRfRUlOVkFMLCBvciB3ZSd2ZQ0KPiBt
YW5hZ2VkIHRvIGdldCBhIHNsaWdodGx5IGJldHRlciBlcnJvciBtZXNzYWdlIGFjcm9zcyB0aGFu
IG5vcm1hbC4gIEkNCj4gZG9uJ3Qgc2VlIHRoYXQgYXMgYSByZWFsIHNob3ctc3RvcHBlci4NCj4g
DQo+IEJ1dCBpZiBpdCBib3RoZXJzIHlvdSwNCg0KTm8sIEkgdGhpbmsgaXQgZG9lc24ndC4gT0ss
IEVOT1RTVVAgaXMgRU5PVFNVUCBhbnl3YXksIGl0IHNob3VsZG4ndCBiZSB0cmVhdGVkIGluY29y
cmVjdGx5Lg0KDQo+IG5vdGUgdGhhdCBpbiBuYmRraXQsIEkgYWN0dWFsbHkgY29kZWQgdGhpbmdz
IHVwDQo+IHRvIHJlZnVzZSB0byBzZW5kIE5CRF9FT1ZFUkZMT1cgdW5sZXNzIE5CRF9DTURfRkxB
R19ERiB3YXMgc2V0LCBhbmQgdG8NCj4gcmVmdXNlIHRvIHNlbmQgTkJEX0VOT1RTVVAgdW5sZXNz
IE5CRF9DTURfRkxBR19GQVNUX1pFUk8gd2FzIHNldC4gSQ0KPiBjb3VsZCBjb3B5IHRoYXQgYmVo
YXZpb3IgaGVyZSwgaWYgd2Ugd2FudCBxZW11IHRvIGJlIHRoYXQgbXVjaCBzdHJpY3Rlcg0KPiBh
cyBhIHNlcnZlci4NCj4gDQo+IChOb3RlIHRvIHNlbGY6IGFsc28gY2hlY2sgaWYsIHdoZW4gdXNp
bmcgc3RydWN0dXJlZCByZXBsaWVzIHRvIHNlbmQNCj4gZXJyb3IgbWVzc2FnZXMsIGluIGFkZGl0
aW9uIHRvIHRoZSBjb2RlLCBpZiB0aGUgc3RyaW5nIGNvbnRhaW5zDQo+IHN0cmVycm9yKGVycm5v
KSBmcm9tIEJFRk9SRSB0aGUgbWFwcGluZywgcmF0aGVyIHRoYW4gYWZ0ZXIgd2UndmUgbG9zdA0K
PiBpbmZvcm1hdGlvbiB0byB0aGUgbW9yZS1saW1pdGVkIE5CRF9FKiB2YWx1ZXMpDQo+IA0KDQoN
Ci0tIA0KQmVzdCByZWdhcmRzLA0KVmxhZGltaXINCg==

