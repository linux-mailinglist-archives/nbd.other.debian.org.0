Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BD706A3EB9
	for <lists+nbd@lfdr.de>; Fri, 30 Aug 2019 22:00:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9907120847; Fri, 30 Aug 2019 20:00:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 30 20:00:08 2019
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
	by bendel.debian.org (Postfix) with ESMTP id E1962208C7
	for <lists-other-nbd@bendel.debian.org>; Fri, 30 Aug 2019 19:43:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id H9pu4eSuBCQ3 for <lists-other-nbd@bendel.debian.org>;
	Fri, 30 Aug 2019 19:43:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -1.25
X-Greylist: delayed 3776 seconds by postgrey-1.36 at bendel; Fri, 30 Aug 2019 19:43:43 UTC
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40121.outbound.protection.outlook.com [40.107.4.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1467720897
	for <nbd@other.debian.org>; Fri, 30 Aug 2019 19:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yjoj7UZj+aZHELq67VfluxlytDjet1+jU1RAczcWgHHV/H42o/mAZ6Y/jUgPII5+O+IlsuabrL5m8zN5K8p+U/P2XcybSFASag9+ZulbXdxTjTSWppu+c8w3mt0cp593cywOScQT3Z1wpgd9OFE29fAOGV1YEnYdxhuQZnH7qkQz8DhohkKUvbULMo9j3CDxSIm+YCVxHyZ5H7rAZsc9hTjMd8SCqQOIEqx6c7tyEqXs5VlyeSNqBpRDgapDNGiYj0A9I24i1cOJ1VwAoLNSfHtDf2BvDR49I+iB6ccQp3cgku69aQ9smQauiO4wz5vycXof3uHGm0oRnJ8NRa2EHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esVz9WS71hnkqClMpJMxRB4ZlrRcCkRRVwbsY5O5Fgk=;
 b=f6gr4RZuhiVSFXMhRWtn897a4JclChX5hunVdV1OTnR7kPpArpCrX3EjJbxcqBQvCu9kxDGSfFv3qrSJ1PVJ2F5bC4h95p4pB+ZqFi6zrJMjAUSmmtJKvUS2/aQzcH7glD5fPu+NgHBD1DjcwTRnYYTGgZ7ORQPoMfXTDZnZfijU4IuJ/btADQpsk2OaAikrSJlYmAoZyOA9iHjifx75Xff2t9osjj5FhSCQ4WgU/Qt0+5JMpJqfbfROMJ3m1JM6V05NquJRyMPghKuOrA8aU6GhveH/8q9SNtAWHl22nw0H/GVgxkXd8CcG2v3iN77W9UalkcK/C8bkKx2tOSs0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esVz9WS71hnkqClMpJMxRB4ZlrRcCkRRVwbsY5O5Fgk=;
 b=mLd/WFYjRwfsD4Nr2KcID2odSMiPsntNyC308UgfNTDTIr67FXItpEMkxItjULEjxA+2rZccdAEk49TmWydJulSBrjHBQSoTKqy+LuO4OvCr2nb5oxLwSeHFJ4xSrjicw752cwOS3FN0GCvwHwFoiKr0YGg4UgwVGCgeTFqBSoo=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5370.eurprd08.prod.outlook.com (52.133.240.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 18:11:04 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 18:11:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "open
 list:Network Block Dev..." <qemu-block@nongnu.org>, "libguestfs@redhat.com"
	<libguestfs@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>
Subject: Re: [Qemu-devel] [PATCH 3/5] nbd: Implement client use of NBD
 FAST_ZERO
Thread-Topic: [Qemu-devel] [PATCH 3/5] nbd: Implement client use of NBD
 FAST_ZERO
Thread-Index: AQHVWcIJJKnc7e4DxUeQDIdpxc9A66cUCQuA
Date: Fri, 30 Aug 2019 18:11:03 +0000
Message-ID: <8dc987a5-ec87-faa6-1e86-d7c3573694f7@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-4-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-4-eblake@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR05CA0154.eurprd05.prod.outlook.com
 (2603:10a6:7:28::41) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190830211101167
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbf0afab-ad97-4281-28c8-08d72d756bb2
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB5370;
x-ms-traffictypediagnostic: DB8PR08MB5370:
x-microsoft-antispam-prvs:
 <DB8PR08MB5370272EAE0C59F3D067357AC1BD0@DB8PR08MB5370.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(396003)(376002)(346002)(136003)(366004)(39840400004)(199004)(189003)(4326008)(64756008)(66476007)(14454004)(81156014)(81166006)(8676002)(316002)(6512007)(86362001)(36756003)(31696002)(305945005)(52116002)(6116002)(6486002)(110136005)(66066001)(54906003)(6436002)(99286004)(7736002)(3846002)(2906002)(8936002)(26005)(53936002)(76176011)(2616005)(25786009)(446003)(71200400001)(478600001)(256004)(14444005)(6246003)(71190400001)(102836004)(486006)(66446008)(31686004)(66946007)(229853002)(5660300002)(2501003)(6506007)(476003)(11346002)(66556008)(186003)(386003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB5370;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 Hipa0Y5icjTuV9ZDgN0WZQBsrarf1P+O1TY9G4zsGj0l3jTjvXtT1vbC4KZW7pQsEqlUOKLg12BiwH3qTuqxZjHKH6vURwhNBtGDIHE38f0WlfOJw0ULstZfIQPw2ojkg/OTUc+VIrYmvLg9WABtbGU3iRqVC71Tb0efDqpwv5prDX3/+f7VQ+K3uBp65BlOpciDbQzX13gsnPwgIc6wc/QJzusVaCp+5b6N5IUMYeu4WnTY6LqOko3uFv2tjepukmltJXWjQFQ0rKqK1O8IYBOci+6cRgM2gaYquCR9JQC7LNTu6zOH/ZqNrC4tlQFufyt7skXvbxZdwmh4LwHnZ2aXtAjyf/ieA7uPXy9FKGkVfOANkruV4dkXM7sbaoiDov1+u0npVzY/hk3bbtOvKLt44E2EXSrJxY45oOZ+eeA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2A6E9ACAACAFF4CB954CFA3E19D6CF3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf0afab-ad97-4281-28c8-08d72d756bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 18:11:03.9587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrPx/zgnO49UXk2wzS6hWWHhAmlvvr0aEyiVgxXlsdbzcxyMSNPTf/IudE17GbLCjziSa+KLptjJX4wDtTs+DZ/YAfELSnXzBvibQjcPpXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5370
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <suXf5_p7qKL.A.IbC.IBYadB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/668
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8dc987a5-ec87-faa6-1e86-d7c3573694f7@virtuozzo.com
Resent-Date: Fri, 30 Aug 2019 20:00:08 +0000 (UTC)

MjMuMDguMjAxOSAxNzozNywgRXJpYyBCbGFrZSB3cm90ZToNCj4gVGhlIGNsaWVudCBzaWRlIGlz
IGZhaXJseSBzdHJhaWdodGZvcndhcmQ6IGlmIHRoZSBzZXJ2ZXIgYWR2ZXJ0aXNlZA0KPiBmYXN0
IHplcm8gc3VwcG9ydCwgdGhlbiB3ZSBjYW4gbWFwIHRoYXQgdG8gQkRSVl9SRVFfTk9fRkFMTEJB
Q0sNCj4gc3VwcG9ydC4gIEEgc2VydmVyIHRoYXQgYWR2ZXJ0aXNlcyBGQVNUX1pFUk8gYnV0IG5v
dCBXUklURV9aRVJPRVMNCj4gaXMgdGVjaG5pY2FsbHkgYnJva2VuLCBidXQgd2UgY2FuIGlnbm9y
ZSB0aGF0IHNpdHVhdGlvbiBhcyBpdCBkb2VzDQo+IG5vdCBjaGFuZ2Ugb3VyIGJlaGF2aW9yLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+DQoNClJl
dmlld2VkLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1
b3p6by5jb20+DQoNCj4gDQo+IC0tLQ0KPiANCj4gUGVyaGFwcyB0aGlzIGlzIHdvcnRoIG1lcmdp
bmcgd2l0aCB0aGUgcHJldmlvdXMgcGF0Y2guDQo+IC0tLQ0KPiAgIGJsb2NrL25iZC5jIHwgNyAr
KysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2Jsb2NrL25iZC5jIGIvYmxvY2svbmJkLmMNCj4gaW5kZXggYmVlZDQ2ZmIzNDE0Li44
MzM5ZDcxMDYzNjYgMTAwNjQ0DQo+IC0tLSBhL2Jsb2NrL25iZC5jDQo+ICsrKyBiL2Jsb2NrL25i
ZC5jDQo+IEBAIC0xMDQ0LDYgKzEwNDQsMTAgQEAgc3RhdGljIGludCBuYmRfY2xpZW50X2NvX3B3
cml0ZV96ZXJvZXMoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsIGludDY0X3Qgb2Zmc2V0LA0KPiAgICAg
ICBpZiAoIShmbGFncyAmIEJEUlZfUkVRX01BWV9VTk1BUCkpIHsNCj4gICAgICAgICAgIHJlcXVl
c3QuZmxhZ3MgfD0gTkJEX0NNRF9GTEFHX05PX0hPTEU7DQo+ICAgICAgIH0NCj4gKyAgICBpZiAo
ZmxhZ3MgJiBCRFJWX1JFUV9OT19GQUxMQkFDSykgew0KPiArICAgICAgICBhc3NlcnQocy0+aW5m
by5mbGFncyAmIE5CRF9GTEFHX1NFTkRfRkFTVF9aRVJPKTsNCj4gKyAgICAgICAgcmVxdWVzdC5m
bGFncyB8PSBOQkRfQ01EX0ZMQUdfRkFTVF9aRVJPOw0KPiArICAgIH0NCj4gDQo+ICAgICAgIGlm
ICghYnl0ZXMpIHsNCj4gICAgICAgICAgIHJldHVybiAwOw0KPiBAQCAtMTIzOSw2ICsxMjQzLDkg
QEAgc3RhdGljIGludCBuYmRfY2xpZW50X2Nvbm5lY3QoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsIEVy
cm9yICoqZXJycCkNCj4gICAgICAgfQ0KPiAgICAgICBpZiAocy0+aW5mby5mbGFncyAmIE5CRF9G
TEFHX1NFTkRfV1JJVEVfWkVST0VTKSB7DQo+ICAgICAgICAgICBicy0+c3VwcG9ydGVkX3plcm9f
ZmxhZ3MgfD0gQkRSVl9SRVFfTUFZX1VOTUFQOw0KPiArICAgICAgICBpZiAocy0+aW5mby5mbGFn
cyAmIE5CRF9GTEFHX1NFTkRfRkFTVF9aRVJPKSB7DQo+ICsgICAgICAgICAgICBicy0+c3VwcG9y
dGVkX3plcm9fZmxhZ3MgfD0gQkRSVl9SRVFfTk9fRkFMTEJBQ0s7DQo+ICsgICAgICAgIH0NCj4g
ICAgICAgfQ0KPiANCj4gICAgICAgcy0+c2lvYyA9IHNpb2M7DQo+IA0KDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KVmxhZGltaXINCg==

