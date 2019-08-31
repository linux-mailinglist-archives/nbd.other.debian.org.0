Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77AA4438
	for <lists+nbd@lfdr.de>; Sat, 31 Aug 2019 13:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BA0CF20421; Sat, 31 Aug 2019 11:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 31 11:09:08 2019
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
	by bendel.debian.org (Postfix) with ESMTP id 1BB75204F1
	for <lists-other-nbd@bendel.debian.org>; Sat, 31 Aug 2019 10:53:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pLHHOGk2wC2c for <lists-other-nbd@bendel.debian.org>;
	Sat, 31 Aug 2019 10:53:21 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur03-db5-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-db5eur03on0706.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0a::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 50FFA2035B
	for <nbd@other.debian.org>; Sat, 31 Aug 2019 10:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZa1tneLv3Rls4JlGdbubglBjbFV8Bob7PiJluQIEye/Iuo2Aolv9Ck2EzdSsMbiI7Pu1rGZ8pqc23Ml9dmr4lVV5NSE3dJMJm8+RUV36jHApUDUR43TLauCY7DvnXsjkkPuPBbOLS2U75n2p58GHth2vxvjj3CQp/ls6qs5Qy2vWdOpXzI8UA125daBPwTrnouVqf1+CXViAXn4pR6Cm1rAcgyQpbwAgfCFW0JI1+zy3H3oOvbAeT0YEzG7a4IjpBStLedOQleKkUeumLKJe3OurGmt5Sbaon15hsh3Wi/4z25jkitc8Fqq+8MgxaMn19GHehn/5ozvou2yzbm5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37qFa2AQZEIJAYcZ3/Ij95UKA+3mYQG8mciAKTIikLU=;
 b=lg/EON60d/eBeykU6Tj2ZSN7g1oWhxo6z6/sMeVHaDGwAaPAPWAgt8r/dPYxQmHyxyFN6rQS3JyxMHRwdIrM+tg8p36yR2qWx4FOC2ZtjXqCA+FOhckbHGf3zzrd18dX5N4ruFgQRRABTbB3je/aTydl9ZtHSGHxaMfKFqfGD2QT0AbsbbS5JcvL+7ITuE7L57t5ULA0pVybjIerX7Lhjczj5vUa0V5lumH+DPk94e/SY4VEh22HOuZw0xMv1HF5X3UysG25ZJTf7SWIvihY23LynP0AOzqQHCHgKEUGnmFdHIOuVj6yVOw4ari6mytfT9IjgKS4aDEj7u6SYjDIRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37qFa2AQZEIJAYcZ3/Ij95UKA+3mYQG8mciAKTIikLU=;
 b=pb8VmFZB3jfXBXEHyheN4QGXdPdj5AtGn5lBEmL2IiPCCAvxPWG01MTj+zzFPbbDWjFqTYp2ulZl6M+0HjGv4IQ19+kE9vl3U5N19+HyQGBUq26+8FNjk1R1SCq7UXAqYWRotwZSx36NjyYJGmbMTGmvVm3K35a4nEc0kJQx4jA=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB4092.eurprd08.prod.outlook.com (20.179.9.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Sat, 31 Aug 2019 08:20:00 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2220.020; Sat, 31 Aug 2019
 08:20:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, "open
 list:Network Block Dev..." <qemu-block@nongnu.org>, "libguestfs@redhat.com"
	<libguestfs@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>
Subject: Re: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
Thread-Topic: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
Thread-Index: AQHVWcJnZgUz/ZiSEEiPmfDFNqlCh6cU9jqA
Date: Sat, 31 Aug 2019 08:20:00 +0000
Message-ID: <ca606ce7-90ec-591c-ffb4-6b4f5618bcd8@virtuozzo.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-3-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-3-eblake@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-clientproxiedby: HE1PR05CA0274.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::26) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190831111957744
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5110bee5-4ea9-4edb-3689-08d72dec0409
x-microsoft-antispam:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB8PR08MB4092;
x-ms-traffictypediagnostic: DB8PR08MB4092:
x-microsoft-antispam-prvs:
 <DB8PR08MB4092C1C1668D58072C2E416EC1BC0@DB8PR08MB4092.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 014617085B
x-forefront-antispam-report:
 SFV:NSPM;SFS:(10019020)(346002)(39840400004)(366004)(396003)(136003)(376002)(189003)(199004)(31696002)(71190400001)(71200400001)(14454004)(66066001)(2501003)(316002)(54906003)(7736002)(110136005)(305945005)(99286004)(6436002)(256004)(53936002)(52116002)(14444005)(6512007)(31686004)(8936002)(81156014)(81166006)(8676002)(478600001)(476003)(76176011)(66476007)(386003)(6506007)(4744005)(6116002)(36756003)(5660300002)(66946007)(2616005)(486006)(6486002)(229853002)(4326008)(186003)(3846002)(86362001)(2906002)(6246003)(25786009)(102836004)(64756008)(11346002)(66446008)(66556008)(446003)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:DB8PR08MB4092;H:DB8PR08MB5498.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info:
 j3U1Ktz44dM45Onqd65wEinxWuF2jTy156C9T9+J0kcjsPQZ4Ggpq4aKUqtBlabCWHiJLlWxUeAUIzjXB4Je6K8bsiiG+B6oIOEcBL2ndAGwqw6b0u4SaCdj/Jo//My7oDQ5M84dyh9ykSW2UsnUEAg2woq4UMkI5RfrbINr+2mxcoeXOMy9k+UT4UwmZtrugp2gyRePGyLURa3nGTZt03CII9JD3Wr+1nykemhujxaz+byvof6ICYdQRcJZEwh5zHaQKjm31xx0wMf9WUz7zC+wysVZbY9ybOlyjBpprGlh9d0PsXWVFAPb6m61R9bcnLw6dYqK1O4W8d/KL18GBasKbJ/8KaiqF/yXk/BTPzLLNQJvrhnFxt59qLd9Mn0hKNnrv0cKcbSEhl9UALjfzIN6cAkL0HAUWLtgwKpS8Jk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFADED8F31E99140A8E5D4879E64FD5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5110bee5-4ea9-4edb-3689-08d72dec0409
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 08:20:00.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zb2uxGw4OmZQ1ANOGbX7XsLzOHCXRedY8vfwSdnvmtDkcIISSwq4XkjchjJ4AMpGJTJwuwKtx/rSPME6unQ/GJo5JwlOrZxLr1hdnEr0YII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4092
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <x_mS6PujzbJ.A.JkH.UVladB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/674
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ca606ce7-90ec-591c-ffb4-6b4f5618bcd8@virtuozzo.com
Resent-Date: Sat, 31 Aug 2019 11:09:08 +0000 (UTC)

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
b2ZmLWJ5OiBFcmljIEJsYWtlPGVibGFrZUByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogVmxh
ZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPg0KDQot
LSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQo=

