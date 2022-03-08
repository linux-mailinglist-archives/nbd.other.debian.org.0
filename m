Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB24D1AFB
	for <lists+nbd@lfdr.de>; Tue,  8 Mar 2022 15:51:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3D2FD20365; Tue,  8 Mar 2022 14:51:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  8 14:51:49 2022
Old-Return-Path: <Manfred.Spraul@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,THREADTOPIC,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 897B220299
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Mar 2022 14:36:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.908 tagged_above=-10000 required=5.3
	tests=[DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, THREADTOPIC=2,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WeuuTYHCLUc1 for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Mar 2022 14:35:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .bosch. - helo: .eur05-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 18059 seconds by postgrey-1.36 at bendel; Tue, 08 Mar 2022 14:35:58 UTC
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CED552029F
	for <nbd@other.debian.org>; Tue,  8 Mar 2022 14:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtnzMNbudI3T/bBUSFh/QmgtpCuUW3pPon1I28vQrFlINVrawTyQ7kuujK20GJz6IG60TFlOZq7CiQSXjTQAwJjW3ft86lh9CGxEq0l0Xbs/5/U7JRMc6s2ea9DdYDpKlJqzqvB+RefmGwLv+zyNCNEspNaziV4cLBr3nraVaJMLxz6spwoCt0YE/ovSb5ljBpdF8A9VIOsFuS6nZ5/znNMJpbckdI1KZZ7O9kRr3TEK9ZfCuxRIjGXTXdqS5iWB2WDoDwUllZ5HscglsRnweLD6GDKZ6caaq4T7esQXtBu4iA2C03u5tZurszRQGI4o3GbUiIjP3GSjAfvRd6AxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt0bXvdjEX4hnyQgwMAeO9k5+A7peae/HJ2nhCfkixU=;
 b=RzI4b9f+KeYxAUKKndG7b6sAMWN46WKp3hG/cnCII9W5YnpCZoIGSkfxfuyV5uQnoiNln0Gsw0wsUi6YAhqwk5gfj9IqTUsy1O/Nz46LnJjTdq4rZrx5VAf1SWso39oVqmG6RiVgOuFo6HYxMcW6qLvWsbGDfIKoxJ6/FKr78aspIH569PECL7SAPULJEyM66wbCnH2fSb1eRLiaNM2X3XObB3AqpDQZPeo5M4MlNy6ISzhUNTvYl0zo/mCvcpy5X0LjRA7+QWtgwc/DXGR0WnA3bgEtovlkToKZwTEYmlle84qQ1Ll0nHuDVlebW+VMgBR2LsKvd7bk1gpOOg255g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt0bXvdjEX4hnyQgwMAeO9k5+A7peae/HJ2nhCfkixU=;
 b=eq0Li7DlzMDW20VfLRUBkZVjD5KTLantr/lHmeP2FHLzaAoD+ngxSy/nZ80h1cx6TW5eT/kqOpESnHOHnCVmQ2IaVcoYF2rpdDuXMpBA5Lbp/PO23nltis5qGVz/yw3LblveDvg13h89/3lXQJsxzgGPsTnGpI50WAZBM56hNjA=
Received: from AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:348::17)
 by PAXPR10MB5352.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 07:00:01 +0000
Received: from AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::50ee:3464:1edd:8216]) by AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::50ee:3464:1edd:8216%8]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 07:00:01 +0000
From: "Spraul Manfred (XC/QMM21-CT)" <Manfred.Spraul@de.bosch.com>
To: Manfred Spraul <manfred@colorfullife.com>, "nbd@other.debian.org"
	<nbd@other.debian.org>
CC: Wouter Verhelst <w@uter.be>
Subject: AW: [PATCH 2/2] nbd-trplay: Add test case
Thread-Topic: [PATCH 2/2] nbd-trplay: Add test case
Thread-Index: AQHYMri3+3OcmajCHEG/mx1mjtquR6y1Dfyw
Date: Tue, 8 Mar 2022 07:00:01 +0000
Message-ID:
 <AS8PR10MB4835BA9A023C3BC1E04EDA10BF099@AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM>
References: <20220308064944.12439-1-manfred@colorfullife.com>
 <20220308064944.12439-3-manfred@colorfullife.com>
In-Reply-To: <20220308064944.12439-3-manfred@colorfullife.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93d29936-5591-4c4a-dace-08da00d143da
x-ms-traffictypediagnostic: PAXPR10MB5352:EE_
x-microsoft-antispam-prvs:
 <PAXPR10MB535291731BC81863AB08B072BF099@PAXPR10MB5352.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 22JLInRhyaPEbv2MSXqfN5QRK/NJ9dVbxW0/txbD8oZ3RAieDWG3s3ugJuOF3tbm0tv58A7wX8+gvwvulnSkBDl8HAUsEPkn3LfTPtJWIKsB9tidiJZNTCSFuc5Lzxtu9WTi9i+eBX+VHdAZ/DOAPl/fuO70wpoBDZT2DcXEoTFDqNHIVrV+tFJ74nhjPKoDJt4YDv/2/3HWQMaq4EcCLDwcrdsD5PVnz4wv2NhSmNOshRllLjIerQoUQamqpMaXf47sfwDfCqgsJpP1E1I63Uk4j3bwvvG6YVcGp3s2PATfT2KNK+uLXrHi69Y6v5MS8/Nx+NbBvGdm2sPdUt1kg0Vo8zP1MYyfVFGc96iv75ReRk1Sp3mTMfzaxy/FLLDS/RLAHWACMzZ1/HZxhU6NCc/YixKnUxnfLPnRxm+IUv3DyfnE98VC5XMbE/OixJ4GSAjGO18tSbLMrP01RiI5v8/tHev8/I/xoW7HZF3dUa3wNeYrBXil4B0hfnFMj+V84eeB3dLN+Dy0cn3ZsumDqTm9Al0CeGRCQTaXABMq5rE267DuS0yjFKB0tJy0LigLu6bsIcusJ9ri+4UMqnEk6nKDt/7ttndOU7Ul+KZoqpkpimfj72VOBHi1Z+MqVPqBamVT8hihcGySSqiLS+4Ty1nV8F9Ga0cPcysbBjwS2WUKqTimPj8wExej+MUWiA8/BBDtgxBs0kMP+gqk/3TU41is1vQ/tZ6vHkIuEFT5Uyq7+sTi/vKDkX8ptK9PC3iYUL3QfWlYSMOt+bzfyzlydmWU2i/k+hq9c2Ow/8TEzeQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(186003)(26005)(55016003)(76116006)(33656002)(9686003)(7696005)(71200400001)(15974865002)(38100700002)(122000001)(508600001)(4326008)(86362001)(38070700005)(2906002)(82960400001)(52536014)(8936002)(5660300002)(316002)(8676002)(110136005)(66556008)(66946007)(66446008)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MNeNZVY0ZXUpsy1HH5iqE2U3aXpXoxhfB0I3ANwfUcX0wk2Q1cM5luMcrr?=
 =?iso-8859-1?Q?fMa7U4Aavdx3eYVCQfCmHodFTeJEshWfvFuAJtoyXdkeW8rCb1yn86IpRF?=
 =?iso-8859-1?Q?uE1ZOufNNWRcpwLAeryN7htfxMVOTXKZJtdWCdxXdHLCiRUEx7rBpEnOBA?=
 =?iso-8859-1?Q?j6rDr8wGIcyqyE3zZUnZB7/VxSBROGosFJo0QNB7Qt+6TCol2/I4wo+6uZ?=
 =?iso-8859-1?Q?7H8+LuNH6p/sgEErIztaBepw9AUe8OGIr61t+XmwzYj+GEU+9T/Qb1lutZ?=
 =?iso-8859-1?Q?oMJfeRYh2+dGfdCFlRpUoDbC/2gTptzvLWqBRlMZKRs8VvH4TB3SDLuaVA?=
 =?iso-8859-1?Q?2hOk1dfwKQzdT3buIh65bpkBTLPRN8CEZUQ+rfdjlSrXIxBmR4YBdU2Ftd?=
 =?iso-8859-1?Q?EZn81DAjKyq6w9Qz2XnZt2Tmv3n2lINZ5f+Lnn3LU9qnpDJfxBl2AiOidS?=
 =?iso-8859-1?Q?Ic/AXyQuoO/+c42QZAcQFwG04M1TeYrfGj+vRTVm44++aPglPYoS2WSqDA?=
 =?iso-8859-1?Q?RNFd94rHVb0UBTBurOQzbEjYvKfayrp/RLgMcJjA9lIqd2ihmlZ4nw4bm/?=
 =?iso-8859-1?Q?g0p+BlaIi96l0Yf6GrW08KwTlxVvlK+Jg0t/eve+3KGdN4bF+rcBlcwnWW?=
 =?iso-8859-1?Q?YZAJK4GtFKpo7CicUKQeYXHBCRHvdUl/AS4o7LBZ3XZtQwyw5/sbBEj/qF?=
 =?iso-8859-1?Q?1ppnFQdIeIQJ0rmnPMev/kA/oZc+8NqxW8rRA01bA4UOTAzr88EdVVmyvo?=
 =?iso-8859-1?Q?FiHYfEuZWksStlE2Kkw0LRogaB4nc+4s9m+1njrcGTAo5Z48Oz4yGK+6IR?=
 =?iso-8859-1?Q?52vbgJii9cfcndjyDfJ51R12HKpLsWCvvwkOjYVzf8hpM5ymUCIwktxVQP?=
 =?iso-8859-1?Q?iTjDqs41EezBEQkxW73sTtf28W6ILMCkS1kJaxR7sdCPARL76gENdfOijt?=
 =?iso-8859-1?Q?RSQXvqgm4CcSsp2uKvEC3hiDqTEiNRrV2Avrec6OMZF0gOGzkWETZb/qYM?=
 =?iso-8859-1?Q?lQSJfHOxkuQDnSzGmn8YSqbuBtTYE3dzSV58+jTm4PGOiqlkiFo0cbnY29?=
 =?iso-8859-1?Q?nJy/SjwqYlZwXQS37F8EzhUJ3t2iBciMYHnYwWFmRKsXcbt1rvFiQJkZK4?=
 =?iso-8859-1?Q?xt0klgzmPbZSwyTrLyZahDDok5j6vnQZJU395cVdjBlji2LwTuKF2bwdBm?=
 =?iso-8859-1?Q?MIeELmH6Twzyb4VuJklu1DkPkdCr73xbYxiN+mnVSH1041WS9MeoOTll/Y?=
 =?iso-8859-1?Q?x3B6Pft3eCsd//qixY4OZsnVmNL61Bz4ciIPvb8+HnUmTLTCvq9AvVu4Ck?=
 =?iso-8859-1?Q?M2zKGiiuI7E8x6ZZ3vQJY+bCncGSYw5p2J3vtjuETHzcPcNmE4aWWToChf?=
 =?iso-8859-1?Q?OfaAZK+JIydJPE+Q++9YTTfXJ1UZ52Owj5zzhSO8N5jbg0W0f+HZWsiT5i?=
 =?iso-8859-1?Q?bFcjBGGaqGW38FowPnA/yUL1ruzW3llePsuRiyrLV72aXU0muV7dcnaUKs?=
 =?iso-8859-1?Q?GO7AlCA/ZP4ULsOHc3x112h6W4PXp8gEB7Wh6hA89JtEcmMFOKiTL6RJT3?=
 =?iso-8859-1?Q?EjuF2XcOiENZfSOOMcNcW+qZ4cnKsFOnjGzYDFYHqTQt+8qaxyLPY1weIR?=
 =?iso-8859-1?Q?EoYiXLhm/3CF+q78pGqWXH4zQwlXhuizo+OdDQe8K3EebjPOxc/jHkUw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d29936-5591-4c4a-dace-08da00d143da
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 07:00:01.2302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BvKy2zs7frygNGKfBPTGxJOcfGG872LbKMevDjzXTxXsMfHbQ5aW2hQHOEb576+oqssJdJGbBkW0W7BLPrUrww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5352
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8e1Owq464pO.A.2ZE.F22JiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1730
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/AS8PR10MB4835BA9A023C3BC1E04EDA10BF099@AS8PR10MB4835.EURPRD10.PROD.OUTLOOK.COM
Resent-Date: Tue,  8 Mar 2022 14:51:49 +0000 (UTC)

Hi,

Replying to myself:
> diff --git a/tests/run/Makefile.am b/tests/run/Makefile.am index f41eb8d.=
.4c2f635 100644
> --- a/tests/run/Makefile.am
> +++ b/tests/run/Makefile.am
> @@ -4,7 +4,7 @@ else
>  TLSSRC =3D
>  endif
>  TESTS_ENVIRONMENT=3D$(srcdir)/simple_test
> -TESTS =3D cfg1 cfgmulti cfgnew cfgsize write flush integrity dirconfig l=
ist inetd \
> +TESTS =3D cfg1 cfgmulti cfgnew cfgsize write flush integrity replay=20
> +dirconfig list inetd \
>  	rowrite tree rotree unix integrityhuge handshake tls tlswrongcert tlshu=
ge  XFAIL_TESTS=3D@RUN_XFAIL@  check_PROGRAMS =3D nbd-tester-client @@ -19,=
7 +19,7 @@ nbd_tester_client_CFLAGS +=3D @GnuTLS_CFLAGS@  nbd_tester_client=
_LDADD +=3D @GnuTLS_LIBS@  endif  CLEANFILES =3D buffer.c crypto-gnutls.c c=
liserv.c -EXTRA_DIST =3D integrity-test.tr integrityhuge-test.tr simple_tes=
t certs/client-key.pem certs/client-cert.pem certs/server-cert.pem certs/ca=
-cert.pem certs/ca.info certs/client.info certs/server-key.pem certs/ca-key=
.pem certs/server.info certs/README.md certs/selfsigned-cert.pem certs/self=
signed-key.pem
> +EXTRA_DIST =3D integrity-test.tr integrityhuge-test.tr replay-test.tr=20
> +simple_test certs/client-key.pem certs/client-cert.pem=20
> +certs/server-cert.pem certs/ca-cert.pem certs/ca.info certs/client.info=
=20
> +certs/server-key.pem certs/ca-key.pem certs/server.info certs/README.md=
=20
> +certs/selfsigned-cert.pem certs/selfsigned-key.pem

This can't be correct. I wanted to add replay-test.tr to a line, not add 5 =
new lines :-(

I'll resend later today.


Mit freundlichen Gr=FC=DFen / Best regards

Manfred Spraul=20

Cross-Domain Computing Solutions, Project Quality Management Software (XC/Q=
MM21-CT)
Robert Bosch GmbH | Postfach | 31132 Hildesheim | GERMANY | www.bosch.com
Tel. +49 5121 49-5289 | Mobile +49 173 7213949 | Fax +49 711 811-5055289 | =
Manfred.Spraul@de.bosch.com

Registered Office: Stuttgart, Registration Court: Amtsgericht Stuttgart, HR=
B 14000;
Chairman of the Supervisory Board: Prof. Dr. Stefan Asenkerschbaumer; Manag=
ing Directors: Dr. Stefan Hartung,=20
Dr. Christian Fischer, Filiz Albrecht, Dr. Markus Forschner, Dr. Markus Hey=
n, Rolf Najork=20

