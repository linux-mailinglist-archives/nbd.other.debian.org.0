Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3579B76E
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 21:54:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3A42B204CF; Fri, 23 Aug 2019 19:54:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 19:54:18 2019
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
	by bendel.debian.org (Postfix) with ESMTP id 70549204B1
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 19:39:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.32 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tWozUNHYQhnU for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 19:39:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur03-db5-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 15512 seconds by postgrey-1.36 at bendel; Fri, 23 Aug 2019 19:39:05 UTC
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-db5eur03on0704.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0a::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B21E820425
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 19:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thx4tbBY2iH1vzkyh7yQgF1qFpaP6gZadxmlWqeP7KbZuS+eIFFArocsu1EQMTnfagbmYTulVv6LPZTV5fp/ubvBICdTOhjJiuEhHzZ1RfzA+5QdzBCoRcqCszw7xmOxClEI+8pnNteHa1lRl9qa8ChP6ajAElvtJBEgn/9K9P1JRwJZMJMedUcuydPBfEyGAoj4z2vxlzEyJfidegLNj4RN3Gdtb6TGbguJDvpIPNJjgtplDkiuwnLP0jLE/dvfOzrqsXKnRMDFdz0G2iT4ObLQYwW5Ei3Pl4nnPvlUVgMgejWhfLCPK7ipdroTVYnyAFEgAwXYfZHd8erpEiRG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs10yTQqe3mVFz/YRDYXZr7vs+j1B4zPDoxF8K41b+A=;
 b=XEn/uyoDxenmkdHTgEBGyYbvO4SkxeAYSflDgjuSy/HBwCkZR0kXeFy3b5EOsK6YIwhQc1kE1bEL8hqCAVjVYgf3AUfRMyqzAdCPYuCA/F1AW9pbof+oJI4iYsOjOCWjsy2zBCyJ1dJjFBCJO+WYe0bFLOMjR0tCmendLnCcJUyI+LFvsxdFNRnZ/bTqVj6epuydFG418D90W7xaM+Zo7IN6j2MYxUU7d+g+9Egf/NgSY+RG4+toga0WLkaUjpDoDNoVu+xEyUCN3pR5S6xb/BOqavtTwJ+nad8Moa8rkjEVa9aLDkSPJxaQhwHAaMOf+35ZeB3oitQTRn1aVsResw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs10yTQqe3mVFz/YRDYXZr7vs+j1B4zPDoxF8K41b+A=;
 b=O/ZAEm0qzde3vaufdSHtuRZoQTxuyfzStk0tQHnKmixrNK7Fhmbx5nxSi66fByJlNUPS/22162FMjN8xAGdUCXAo2XwNPq7c+1P/CW5uXLvCHi13q315Zk3iVnor0w08RmmfRdm8GPas2q/7n7bg2YqEGT34G17dGW1R+8AG+to=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5033.eurprd08.prod.outlook.com (10.255.17.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 15:05:32 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::617b:d2c2:11e9:4604]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::617b:d2c2:11e9:4604%3]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 15:05:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>, "nbd@other.debian.org"
	<nbd@other.debian.org>, "libguestfs@redhat.com" <libguestfs@redhat.com>
Subject: Re: [Qemu-devel] cross-project patches: Add NBD Fast Zero support
Thread-Topic: [Qemu-devel] cross-project patches: Add NBD Fast Zero support
Thread-Index: AQHVWb+6QvwHE28+MUauWUhIkXuSiKcI1OeA
Date: Fri, 23 Aug 2019 15:05:32 +0000
Message-ID: <89042b51-42c8-27b3-f742-894c0a62119a@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
In-Reply-To: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR0301CA0022.eurprd03.prod.outlook.com
 (2603:10a6:3:76::32) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190823180529760
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe319ae2-526c-43ed-05ec-08d727db57bf
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB5033;
x-ms-traffictypediagnostic: DB8PR08MB5033:
x-microsoft-antispam-prvs:
 <DB8PR08MB5033A462C0B9386583A39D30C1A40@DB8PR08MB5033.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39850400004)(189003)(199004)(66946007)(386003)(31686004)(2616005)(53936002)(446003)(6436002)(6116002)(3846002)(11346002)(25786009)(102836004)(4744005)(7736002)(6506007)(478600001)(66446008)(64756008)(316002)(229853002)(66476007)(66556008)(66066001)(6486002)(2906002)(6512007)(486006)(26005)(36756003)(186003)(476003)(6246003)(2201001)(31696002)(305945005)(256004)(14454004)(99286004)(86362001)(81156014)(8936002)(71200400001)(71190400001)(8676002)(52116002)(81166006)(5660300002)(76176011)(110136005)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB5033;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 v/ZpbUNUvyifNLwNGOWgU1eNil59HbchHxEqwsQiFwlNf1QSv7pPHUiBl/Ap1WHOdO7eYuLHnlYbRf7o9SDQxAblwoaCYG1lgcnjJUCYMLsb8FP8aABKkjRAlY550U2BLYcj/jmpFKk3U7kQSQklulIWmQWfWubeX7LZlyuS+NzVgDh8x7adaD0g7ZSRIcqg8//SPWAp1Mo7vfpVAYN1BbNN94xlpGHYTb74FxUbWiqrqJfrdo9u6rlRWA3SvEBhlvY0yWhq3eOemLOd9cFavwPAhR/eJv5DFvmc2q8jO9WNMCS1KEq3DgQh3KIROoqFizaN+AA6hGekk9Hqs84niAr5WmIqSg6+iKXIEQoUnhE9Jgj2Ln3wgOahKUL8fH+lLwmbIEJEUmIkLtk6ToalpFfjmYctqjZ79Nr9FMW16NM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C929FB1C131FE47A0A60CA5E59504B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe319ae2-526c-43ed-05ec-08d727db57bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:05:32.1583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TF9bIycHjViJwrYkO/hDesB3dvQBpHD1Iv25U/xBQzLEybN02tVUIBLMFzl+cFc6Q+wWhjeGl+UXyFqcaqeraWsr7U6tSPX3V+PCAdEs6IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5033
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bsndFzHr9JF.A.5-E.qREYdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/648
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/89042b51-42c8-27b3-f742-894c0a62119a@virtuozzo.com
Resent-Date: Fri, 23 Aug 2019 19:54:18 +0000 (UTC)

MjMuMDguMjAxOSAxNzozMCwgRXJpYyBCbGFrZSB3cm90ZToNCj4gVGhpcyBpcyBhIGNvdmVyIGxl
dHRlciB0byBhIHNlcmllcyBvZiBwYXRjaGVzIGJlaW5nIHByb3Bvc2VkIGluIHRhbmRlbQ0KPiB0
byBmb3VyIGRpZmZlcmVudCBwcm9qZWN0czoNCg0KSSBhbHdheXMga25ldyB5b3Ugd2VyZSBncmVh
dCwgYnV0IHRoYXQgYnJlYWtzIGFsbCB0aGUgcmVjb3Jkcw0KDQo+IC0gbmJkOiBEb2N1bWVudCBh
IG5ldyBOQkRfQ01EX0ZMQUdfRkFTVF9aRVJPIGNvbW1hbmQgZmxhZw0KPiAtIHFlbXU6IEltcGxl
bWVudCB0aGUgZmxhZyBmb3IgYm90aCBjbGllbnRzIGFuZCBzZXJ2ZXINCj4gLSBsaWJuYmQ6IElt
cGxlbWVudCB0aGUgZmxhZyBmb3IgY2xpZW50cw0KPiAtIG5iZGtpdDogSW1wbGVtZW50IHRoZSBm
bGFnIGZvciBzZXJ2ZXJzLCBpbmNsdWRpbmcgdGhlIG5iZCBwYXNzdGhyb3VnaA0KPiBjbGllbnQN
Cj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KVmxhZGltaXINCg==

