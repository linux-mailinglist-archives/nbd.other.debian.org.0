Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E954F5A86
	for <lists+nbd@lfdr.de>; Wed,  6 Apr 2022 12:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7E57A2054F; Wed,  6 Apr 2022 10:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr  6 10:18:10 2022
Old-Return-Path: <prvs=08844476d=Johannes.Thumshirn@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,THREADTOPIC,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 18CB02055C
	for <lists-other-nbd@bendel.debian.org>; Wed,  6 Apr 2022 10:02:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.51 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, THREADTOPIC=2, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uQ-awdbC5yix for <lists-other-nbd@bendel.debian.org>;
	Wed,  6 Apr 2022 10:02:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 336 seconds by postgrey-1.36 at bendel; Wed, 06 Apr 2022 10:02:01 UTC
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hgst.iphmx.com", Issuer "Go Daddy Secure Certificate Authority - G2" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 01CAE20557
	for <nbd@other.debian.org>; Wed,  6 Apr 2022 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649239320; x=1680775320;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
  b=A/1IGoIynr7WRoYyVYM2bJkR5mXW/UTVwPeFYQ9FO3iJqkkrdWVQXIli
   9ftgaQpsNgRzooJhKJKoF5/fjEPkNiQBWFsqAd2vYROmvppN0onMl6CkW
   Bwg2PeSkPNzqQWENJYFI6sDKa/Z72pWXwHYUnH/vqCXEm31wHtikZxgYU
   Dd+Nd31RSvxHwIdqEVo8QU2PGno0OHzA1db5yTV9SFP4P/zKZm2Ub4cP5
   dcHUiSYPekb/SyrxpcZd88ly8biqDJIbZEohTxuZWLixIhgVxM+q2zkhC
   lwM0fsrHejkc3jD8ljwE7JBgF+NHFqigB8SnA5OGJfqPIcpXuxG1o/XG2
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; 
   d="scan'208";a="197229644"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
  by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 17:58:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZywV7ltuw9siQImxgkQoPP6wfeZPfN+DIbYHoqvFqg8PspHMPPVbjOGu34Y1VCFutPfcbN7w1CG9uIcpq7NyPeQGhoZepeW1TOBP2zlcPqBmDXXzU/6c4WbvphC7Vg116kMB0hFPBg7c0Q8rkL+JUb9EXS6dJaeFy2qxfVUyz6z5nIddZ1wFqqzpUGT5JOGzqrfslikOn+wgvc+mUxHDocSWTysyYNK8wrMgO8wpoMwwUIy+nw0WFak2qxflo6GZSub70OFUZwWc0j4ME1BjgYxeSUHxKV4AKu7Di064nEfOqWFlcU+DqH/AlhZbI61biQSOcOMiOF9lEL7ZElf4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=AbViV6LyHbwBkCkSSzHf7MhBfjPBdr54WKxpT8TH/IU79sCSAQffxHuxJ9RNY2EzqxKBO+p/CtlU2dIfFhcVyLKexjvE2GMJkTgUnVGgE8ZOGiAjsWqGZCz+S4s0fi2KF7ovt1G+WQXRH9g/XDe2khg/oNuFANUcA0NsqpLGuhYCzvHSwii3EIBQFNHKMIid6CPBxGtrz4Mt5DenDBgz5WpbjSMua2zobVu8OimqR7cgihpvHcnC6bLPpJAgTQfi0XWpFkQ8aMP4PqpPSOJMwa8Rj/g7k4SszozuP84H/nQt/5puzDMJImjRpwNl+TA3FTVQjs1S5PLAZKzjLAUHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=vanbsnJo4FhAc05B4EMLdoIDZnZc6CnMGAlQXIgKOZVYA6DbT80UxMUlZ/wZQXpK2g5bXanvTRVKrwfWuZkUTgFBF43n8wxbCegEebQVh5Yb5s9fBVE6XXBs8KIPE7Ai+IRlVXIjfihcLTETxl4No0fuwffum1oyx+1efB7QykE=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by DM6PR04MB6607.namprd04.prod.outlook.com (2603:10b6:5:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 09:58:44 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::a898:5c75:3097:52c2]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::a898:5c75:3097:52c2%3]) with mapi id 15.20.5144.022; Wed, 6 Apr 2022
 09:58:44 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: "dm-devel@redhat.com" <dm-devel@redhat.com>, "linux-xfs@vger.kernel.org"
	<linux-xfs@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "drbd-dev@lists.linbit.com"
	<drbd-dev@lists.linbit.com>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-bcache@vger.kernel.org"
	<linux-bcache@vger.kernel.org>, "linux-raid@vger.kernel.org"
	<linux-raid@vger.kernel.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "target-devel@vger.kernel.org"
	<target-devel@vger.kernel.org>, "linux-btrfs@vger.kernel.org"
	<linux-btrfs@vger.kernel.org>, "linux-ext4@vger.kernel.org"
	<linux-ext4@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, "cluster-devel@redhat.com"
	<cluster-devel@redhat.com>, "jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>, "linux-nilfs@vger.kernel.org"
	<linux-nilfs@vger.kernel.org>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>, "ocfs2-devel@oss.oracle.com"
	<ocfs2-devel@oss.oracle.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH 14/27] block: add a bdev_max_zone_append_sectors helper
Thread-Topic: [PATCH 14/27] block: add a bdev_max_zone_append_sectors helper
Thread-Index: AQHYSZgY1jr1xIM/YUq07NGHawfBLw==
Date: Wed, 6 Apr 2022 09:58:44 +0000
Message-ID:
 <PH0PR04MB74161D2CCC5AD43AF09264799BE79@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-15-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f6a7f3a-4bbd-4cc2-85a2-08da17b40972
x-ms-traffictypediagnostic: DM6PR04MB6607:EE_
x-microsoft-antispam-prvs:
 <DM6PR04MB660754EAC2F7575A81C46B4A9BE79@DM6PR04MB6607.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Pf+KzgmagSIS5atE7qUNGRr1myBVVGSwEKyeGnwHdGjwF8GKBkvoIHDqMGnWFjO7XVa7Cmit9VnU9OIYztUkoZ6Oaqq+m+DiWH3/Dcl/UxK+P88E3f1isC2vpAnDpZpqgSoxQyKuSo19P3TzE/8glOLI6z0BLxqJa3LBIp+eJLbka+iU9uRCJGcYyq2EzzvF+GSwaV6/rfbL34RfHGjSRx0zwHlAe3Kbe4uou4XPkMqQqujVK+FspM3sA99WzgIx4Zcg+5oQR1jIyR4eA4XENp/K0m69Xx8aQEVd4C4NwBIAYB3DJbFAzY/xwFTEh8jZCLaKfZtso51HpFNskLoQWcTVyjcyZmpcj72RYBDj8bY8b+y0gW5f99u30BEwD03iXMk539DztkZxuC2HzN3BPR9e7KwNaRwwncQjXFedlJ7i/0TsMz5nf+dZ1/3hTsc6CrDt4p9WXnzuh263wo3xd8b6MW4eTv1TtLR3IzWdMRJG6cBeGO9RPQAMiItBrNypFxmRFeU4T1cp36pirzbw2w/ywCTEUkYc9uazSWAmIkbs2ELSVlHFGtwIR9gzIB7PlEGWJvLVp2CUKQFt3mcwlEIarIZ+6NjuqDOsMS6YGKX7bI/K6LKHavdoNguno7hvxdITrai2aC+YdO67pyr3n4smmpegwjXfnaI0Pmp9jFcUJll/tJASQJQReuEZSzAgzPzXDpY2hiiRf4a5gE9HNg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB7416.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4270600006)(9686003)(508600001)(186003)(6506007)(7696005)(2906002)(7416002)(5660300002)(55016003)(8936002)(54906003)(19618925003)(316002)(71200400001)(110136005)(66946007)(52536014)(91956017)(66476007)(66556008)(4326008)(8676002)(64756008)(66446008)(76116006)(122000001)(86362001)(558084003)(38100700002)(82960400001)(33656002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FnQ2cDOI1Y8dqfwBZ9O49we2ex33sga4MDlqyPsi59CHLjzinNdqahxJKb+7?=
 =?us-ascii?Q?nLvA4glwLQWN5EGlwq9Vu5N+6RAHp5zPzMSHYKAI+ROqS5ObV22YE1uWhKPU?=
 =?us-ascii?Q?t/Slc0Vx6la1V2Ehl/8AFvAWHw7Kk3JevtOLqRNrLr0w3euyxPc4I6O7fPTQ?=
 =?us-ascii?Q?wLfN+Opb6mKJvfOq9BzXaoPuzM535gJJgXGiZQqr6/qzazXpx3T737nbJ/fT?=
 =?us-ascii?Q?5AYtInAAQcaVRXLBBJ6GN9tSCFD9aXABykDN429p4xlLfpuoDafHP6Jt5DbB?=
 =?us-ascii?Q?Iydzn9jRd0E0RXYdxFp2csxTMSqFiUWkGWouJQyBb2zUZOXn7G6VB6J4KuZp?=
 =?us-ascii?Q?fgPATSu1EoTsQYfHXonfg+YKrx8NlCxiY/WvDPDFylow6ArLN9X0TnmQSu+/?=
 =?us-ascii?Q?95IkUf/R+6oTU/6z37jGwKNh1BGImR8Z7zNd/uM1kkUQPDt6xtfwy79ITE6l?=
 =?us-ascii?Q?Q9xvZjwe1VhuWGzbavCQQVHCFV7hHqZE4hFqaAuJ/8loV7GxSt384nH03jh6?=
 =?us-ascii?Q?9hvUXSFWyQok4WycdVBAq2Pne6x63Kd/dzPArvViOJMCNXPPzMfEK2zH+VNk?=
 =?us-ascii?Q?3w+JAGP9eY7icR0QYXZpvCQn8jI2n5T3gvnfOW20uZaiR/w7EP9NAVWC238p?=
 =?us-ascii?Q?YyBdPiC0Py8H4BU3o6Exn/i3teu+O1s1FRXY9XsoYqSfv67wXY2BgOSNYQbS?=
 =?us-ascii?Q?A5HFhEpzP7fd8WRvXw6jIXWJduai4VwRFzBDYyAROlXlWkq4K5uZrnKpDVri?=
 =?us-ascii?Q?Lt5+iS19PHx7Rg1R4wXdhMzRCIjeeZd6PFaYSh3xZnuu+5Y/9ohSG9i7K502?=
 =?us-ascii?Q?1a/bzUyzkQNxTw1tQYH5EyiyC91aNMcH4nxXhtJ0Wedzj7mvIGc92lxOt5nE?=
 =?us-ascii?Q?JXxVC1uDiYmPEFzx4Y7D/dReZPhWqdc/jJdKt2W1YymXQazllgQwdagCnVsb?=
 =?us-ascii?Q?womFEzuPHfgISWVwI5IydynP4xWEHyHSeic/OWVf2vvnSOGfChy1xgRteWK8?=
 =?us-ascii?Q?O6lHklcYNZMBh105u3WOxpHTEenIZDxy4CJyZmOxjyHRyQ4/hAEahlgNd5T0?=
 =?us-ascii?Q?IIYsp55Li1hGb6kle+7E42lhFheoGmLSgVlPzJ2wViUr5JkB3zXPshZNHdCK?=
 =?us-ascii?Q?Drnr9ry+2eR2o1K0g1sZTYgaa453J2FLPb9EsxMmvl+A368fmvtLSJc6/GHO?=
 =?us-ascii?Q?kvIPug1OZFdbVSPQJnxaWdWK/ZgXRpNAH8KH2/la8sZCkHzfpGIcxpeAnxvp?=
 =?us-ascii?Q?Fu1KO8wFnzRvdlhTkpS+//xvC//Yvj9IUA7H47sdMX0MyyQstXAAASDIKQzq?=
 =?us-ascii?Q?4itpwg8G4I0h6hT1UWz/LYa9haG+XO08rx/HcQSRBLKhwhVFQQ/8TK7uDzGe?=
 =?us-ascii?Q?UrBw7s5v4mnnSjnPPV0U3E8GhTQO8/rq7n7rEAF9/BOb/A895TI4AENRfP2H?=
 =?us-ascii?Q?p0lPtXAfbYI2WYitkaAvMjep+iCpB8qGIW0MlNI4ahmo4gxlHF5/DOEVAML3?=
 =?us-ascii?Q?BsIhXDlHoRVG0p5dRxMkYVIPTIGR3tyHD8mDdRoSdVHc4PDkENOpi0vFrLjM?=
 =?us-ascii?Q?EsYFTB8/yWBXoKQrEy5lf4EqcvGyrksY/i+ncEk0C/qi0ucMo5O259xy4P5n?=
 =?us-ascii?Q?3OstWIQojxiCGjB3QzJ3ozRjmyPwY1cmzijUV+XzsMpKKikC4jRprDn5XJ3B?=
 =?us-ascii?Q?Z+ROJZpHXnIZCV41bUfdPSJQIk3jFqaSY3c3C5xSCmsfRuvM5N+mx+Qv0l5x?=
 =?us-ascii?Q?vgoI5NvxJ4DIaRE4F1vbqPEUlylYZ3nOFgGkB+69touDu3OoVoMGP2adpG05?=
x-ms-exchange-antispam-messagedata-1: pB0amHYuRq2xU5J1OT0zoHwBXpZuYFgg+OQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6a7f3a-4bbd-4cc2-85a2-08da17b40972
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 09:58:44.4524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIO2gZbnUPowYwL5/+TFbMlM0mfXcWCM9eVRDLVDk37wzbnptzItElefyoFDRl92/LtkQZrZmaM/CVn+ZNQbb4SjElNyDclRC+u7dyWjvW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6607
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RPCp7OsdqML.A.UTB.ijWTiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1882
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/PH0PR04MB74161D2CCC5AD43AF09264799BE79@PH0PR04MB7416.namprd04.prod.outlook.com
Resent-Date: Wed,  6 Apr 2022 10:18:10 +0000 (UTC)

Looks good,=0A=
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>=0A=

