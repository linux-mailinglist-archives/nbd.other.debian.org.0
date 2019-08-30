Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 52835A3E68
	for <lists+nbd@lfdr.de>; Fri, 30 Aug 2019 21:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DCD8A208C9; Fri, 30 Aug 2019 19:30:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 30 19:30:08 2019
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,THREADTOPIC autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B0BD1208B3
	for <lists-other-nbd@bendel.debian.org>; Fri, 30 Aug 2019 19:14:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VS0QCMvQ3-eU for <lists-other-nbd@bendel.debian.org>;
	Fri, 30 Aug 2019 19:14:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur02-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0705.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe05::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AF156208AD
	for <nbd@other.debian.org>; Fri, 30 Aug 2019 19:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr6PnjFYK25s5Ev1pf9SXDUAWy5NXwsQN+ivBp+DUj9ZIaTwmvUB/Mv4Hwt+TbEYs5HW82AfzSqbMgdRWmLI1cc9RqywlJajlObxzQWS9ukkj5qzUUUyDhbTa0FaUgPj6Cw3oTGsnpQ0GpFqnRjw3bd3sv01aJnPukgfiv4064ZcpdWXy/1K5EjQSVg3xR/PBhAyNxP0sAYLVw4npNAz6/8ODSgbvi3j1BgHjCc62EeM9DVhEOw6ffuNDGEgEV8AahISoM/udW8VYTOXgKWIyJe+KLInlzh5woFV4FUxHNEEiHryRrnJC9CVomSUyWYDYe/qyxKilWRg2ZenBwsErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iVSoOysQd9zQdlJwjdWCEaYDPSjnezO6MZ8TNuq0+g=;
 b=Hro/Mxe5XYp4qVmXRSlyr2PBYFIm35FzMLaEcCVquyaoylGWhRBMscuYNqRolLQHLojv/g7IP6OJcHpeSo04abzk9QixONpqkpSrs9C5d2Zuo6s026TqNa2chXFnylxxzBJbLLVlUuSPVSV8XOT/Fr1uV00KX9s+1sF8q5bEdvItLldfD6LQH8p3MvsDZk2GuMPYcOznO3/YIHe1Br7bTg4czbWWFh+fLPOtPkDcBLEUS2Yq9V/U5qsXw/xpUtHzKoKmC3RzgMD1hiBZW+yIL9FDHR6k1NVQAYM4RoY/Y+V0Ing0RWZHM5qVK0bGCG/xXRVJqWSxVW5SRN8zJl5mHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iVSoOysQd9zQdlJwjdWCEaYDPSjnezO6MZ8TNuq0+g=;
 b=LmD6tyhk7vs6ToXGZH0/IvG0q/SJhvx5YgqPdOAxSnXQ7VRX4fxsr8cScB4kz+lnL8K+0Qo+xS7agPuBazWKA9UB/6NBu4R3RdTYcVGl+p/ETtVD2SVNt7aIzZPJMX8sD1XbScwqxTcG1hCVfiCkQZ10UdWL3Iy1F/pZmyBD3nw=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5145.eurprd08.prod.outlook.com (10.255.18.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 18:40:43 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 18:40:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
	"libguestfs@redhat.com" <libguestfs@redhat.com>, "nbd@other.debian.org"
	<nbd@other.debian.org>
Subject: Re: [Qemu-devel] [PATCH 4/5] nbd: Implement server use of NBD
 FAST_ZERO
Thread-Topic: [Qemu-devel] [PATCH 4/5] nbd: Implement server use of NBD
 FAST_ZERO
Thread-Index: AQHVWcHryXvzVKpm1EKM/5k0Yzo5DKcUEVQA
Date: Fri, 30 Aug 2019 18:40:42 +0000
Message-ID: <e01f047a-33c5-1fee-d335-c1e1ae04284c@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-5-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-5-eblake@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR09CA0049.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::17) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190830214040587
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81da1a65-0c0a-4947-40d7-08d72d798ffd
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB5145;
x-ms-traffictypediagnostic: DB8PR08MB5145:
x-microsoft-antispam-prvs:
 <DB8PR08MB51458160732CEC510FE0C681C1BD0@DB8PR08MB5145.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(396003)(346002)(136003)(189003)(199004)(256004)(316002)(66946007)(4744005)(81156014)(2501003)(81166006)(31686004)(66446008)(14454004)(66556008)(8936002)(36756003)(66066001)(66476007)(64756008)(6116002)(6512007)(71190400001)(6436002)(110136005)(52116002)(71200400001)(5660300002)(476003)(486006)(6246003)(54906003)(76176011)(3846002)(4326008)(53936002)(102836004)(99286004)(229853002)(2906002)(478600001)(6486002)(86362001)(2616005)(446003)(11346002)(26005)(386003)(186003)(31696002)(7736002)(14444005)(8676002)(305945005)(6506007)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB5145;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 p6wTPYuEziLSNKPEGg+LtlNRwqpE4umVGE1sOTO3kvTOsqDVKoh7XZipLf/ppBawXhidamRyXbQBCEvGhE8NvwBIkGzawRMiAk2MVXIhTu69sYsi/40RZNKz3d7QMetKfYGRxLb6Mbr2g5lSfNd1wS1aiZv/VeiynV7iw3E7wdixmmrLm0hSmER5csRJ70YfOcXxqoE2I/L1W+i7BUKEsC9zFKJGBMw+evM48lEpChPzqjDe7H/bzfT7fflnmspKc2BlGKUxZcQrR7vJCHKqsPVZaPSbiRM1LnCOjdXWiwSWNBsj8BASUUu9CEe99h/7eKxstjBFA35TK7BjOUHPcPD8bU5o6GY2A2fIKh6g0MW1wBnoK+iyw/Mub7AQWeRuxjk0cp9LS7BNYo8Z7UuTkBgqkZsvg/b5bSngYbvA8eY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <65E0C72F1C53C24F9AA50D9478411356@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81da1a65-0c0a-4947-40d7-08d72d798ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 18:40:42.8407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gtsZC0vp3/gN+0C34rKPvW99ig/cDDs5U7hhLMJcWDNIkDk2eUeoaNbbEW3KmEtxkiZctMSn6wMbd6u63dKe1PkvvJHOC+BGlrGR+z2V5ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5145
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fqZAIFWB1wG.A.H9F.AlXadB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/667
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e01f047a-33c5-1fee-d335-c1e1ae04284c@virtuozzo.com
Resent-Date: Fri, 30 Aug 2019 19:30:08 +0000 (UTC)

MjMuMDguMjAxOSAxNzozNywgRXJpYyBCbGFrZSB3cm90ZToNCj4gVGhlIHNlcnZlciBzaWRlIGlz
IGZhaXJseSBzdHJhaWdodGZvcndhcmQ6IHdlIGNhbiBhbHdheXMgYWR2ZXJ0aXNlDQo+IHN1cHBv
cnQgZm9yIGRldGVjdGlvbiBvZiBmYXN0IHplcm8sIGFuZCBpbXBsZW1lbnQgaXQgYnkgbWFwcGlu
ZyB0aGUNCj4gcmVxdWVzdCB0byB0aGUgYmxvY2sgbGF5ZXIgQkRSVl9SRVFfTk9fRkFMTEJBQ0su
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIEJsYWtlPGVibGFrZUByZWRoYXQuY29tPg0KDQpS
ZXZpZXdlZC1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0
dW96em8uY29tPg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQo=

