Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CD227EFE
	for <lists+nbd@lfdr.de>; Tue, 21 Jul 2020 13:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 27E682053E; Tue, 21 Jul 2020 11:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 21 11:33:09 2020
Old-Return-Path: <prvs=464b1537e=Damien.LeMoal@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,THREADTOPIC autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EA9B320546
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jul 2020 11:15:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.62 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3, THREADTOPIC=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O97azlxW_0-S for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jul 2020 11:14:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "Cisco ESA Certificate", Issuer "Cisco ESA Certificate" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D73AF20541
	for <nbd@other.debian.org>; Tue, 21 Jul 2020 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1595330098; x=1626866098;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=O/HqDqSSS9dermKCiFktK5NpA+cZHhXCJCO1yJV3rzo=;
  b=n1ZJtlHebsAt5LRz0InFTmQz5K0rrZTvz/W4J4qjoZFzyQxpjAWWa+Tl
   mR0n20hRox2P39GGSIHjdv3njU6hMZUWqJbzVNinxhMypwuX2ME9QK9fV
   OPe6duiSfZiqZTHhWCyrUpWnRNg3++YCwfv4LwWWlm3GPXSw0An9cBBQ0
   f592HYKOwA45J81XjRFuICA1y876HhEESHG9QIuIZVSO/ScWl0Dd85nCL
   CS7n2JHyXcZQiigdHVn0WV2cwVuLed+fw3KUw3AKPumJXJCCtueNxouJi
   HCRzzjyLBcoQwb+qhx8MX9RSNlV/ZEkay1cD/Ycj+qupYrim8tE05jVcU
   Q==;
IronPort-SDR: AikWfaaCXNJ9ZeGM10ivxu4HtDUNFRsYif+AY7dztyfSNv4W3BessxslVkoTZNgCE9KJxYcC1I
 5V1fuhfCCLBCSX2z+VG6/QRzWJ4E7591xBcZW3ddH6/dhCd6HzLRQKqu4kZ00lnwajAOUEJfuH
 +vTpDaxKY4WIFNyhQVbOcAUlvRYIIzsVSGlQSzdxfGMRTBTrHun0XNV1x3SV6bTE7T5a3MMyNI
 bTPXqmixcI26/TFr1ohk08Kdjt7SMbC0vdzyqqesmVv7CVKu+z7tymUbPijTtomBV4TAKnOk0G
 m2E=
X-IronPort-AV: E=Sophos;i="5.75,378,1589212800"; 
   d="scan'208";a="143010090"
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jul 2020 19:07:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMJsVe8M3dawj91hfy0kBVmL76H71RJPIe/e+lsxX6zU8BX4c3iMXTYcBE7G7EzZZFaSnB7wun4B3tjBQY+7EfJeqS5BlDw+PWP5pR38cXu/kNJluzvK8Ym0tDIYnx5R/Rc2BkpLOeQYTfd327J9sZZOete9wsBB+LtoCdg6DWMTfDRLaJQWxG9nCdNOkIeNgA2W9CBwad+ejzvikBaSlK9zQT1jMpjqrgoxHw2awf91y1Nmz8qAPF/dFnZZBuEXbrZTsuXLGkIKDo8t1KgfsBsaAiab+yS/E6N/2MXWLPW7lUcK6FJSr3+mywmlzMOjzZes7SNATaskDdDDQG5nig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPXGLF+8MKV1BFG+Fx105GQdYuLQNeSBkNa2xkqDg+c=;
 b=UObzk3xD44qjPUbVLfgMtA5dO/U3zhwkjbj9IRB00N6KdEVbYi7EnnEZ/8F8kVmaEAA0EwHsmORJ6w5ytmCUbIozg9N7C9KhGy9Yh9TVWfjCeaffksSq00yeuW2TvrMiJW74RMLWViLmHMou7ztGQJpLaZMnDmmCKN8E/cL4frLw01PuKaYIST+pYP/G7U/iTFUPw5BVd/FKyE+PLmfgG1raww64F2VbfNwhnFPuC9RQKMHKBRSF8fN3mnIG9UNMow15g5RTUhGp4y0pzcsqkIowuAKb0T7u28COR6rFQjcLqv8TJqDeZOrkl0Lm7inqJEaeNEbZL1HCevIWr1HMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPXGLF+8MKV1BFG+Fx105GQdYuLQNeSBkNa2xkqDg+c=;
 b=ayL7hqRcBvJy8Xp4R45LwlqDIKN0fPpOjcti8QC6ML0q2nGZ0WKh0bN+o3BSedGREGOlO6+xFSogUoxmFNfUYczXwEvgiKiQFBSdKd3HiVk4TjZ2zRPCepGsVTC6RuLyr8OD2u9ybtpFcZr8zBA599M4F2ax137XYTJL27EWvfI=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0422.namprd04.prod.outlook.com (2603:10b6:903:bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Tue, 21 Jul
 2020 11:07:36 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 11:07:36 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Keith Busch <kbusch@kernel.org>, Josef Bacik <josef@toxicpanda.com>, "open
 list:BLOCK LAYER" <linux-block@vger.kernel.org>, Sagi Grimberg
	<sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, "open list:NVM EXPRESS
 DRIVER" <linux-nvme@lists.infradead.org>, "open list:SCSI CDROM DRIVER"
	<linux-scsi@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Bart Van Assche
	<bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Jason Wang <jasowang@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Colin Ian King
	<colin.king@canonical.com>, "Michael S. Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, Ajay
 Joshi <Ajay.Joshi@wdc.com>, Ming Lei <ming.lei@redhat.com>, "open list:SONY
 MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>, Christoph Hellwig
	<hch@lst.de>, Satya Tangirala <satyat@google.com>, "open list:NETWORK BLOCK
 DEVICE (NBD)" <nbd@other.debian.org>, Hou Tao <houtao1@huawei.com>, Jens
 Axboe <axboe@fb.com>, "open list:VIRTIO CORE AND NET DRIVERS"
	<virtualization@lists.linux-foundation.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, Alex Dubov <oakad@yahoo.com>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
Thread-Topic: [PATCH 02/10] block: virtio-blk: check logical block size
Thread-Index: AQHWX01DbEMA8Zwy80e0tn9EoedI8Q==
Date: Tue, 21 Jul 2020 11:07:36 +0000
Message-ID:
 <CY4PR04MB375159E32C34FD487EB33C5CE7780@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-3-mlevitsk@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 287fc062-1b11-4bc5-2e9c-08d82d664680
x-ms-traffictypediagnostic: CY4PR04MB0422:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <CY4PR04MB04229A424AE02EDD90E372F9E7780@CY4PR04MB0422.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0HPFxxFdR54sfwrOFZE12wI64ZyZVSzXovfeYpVq6/GjutXOUlI5pFeEJ26Mn4zrWv78QSK6JIE/KpQy501B8bwWDUmHCtzL/VsBC1hqn/XzPFeh3pNdo3v6kIdjjnF0hazxtzLQHAnY63r2SKH9VRP9rqAw5ejB2b/Ku6LoP1Z69NCuROJOxgZ+XkupwL03xI7HDFutw9SwApEVde5pmphWeMz5gnwsek4gv2Zea3WXjICmS0LI/u0Rkfz6dR68VFAvYF/rrYWN27fhzjKts70Ku5Iy+IBRPjHrU30eGpQAP0DxRwUWrWzybYpfWmOPdJJa8p8HBqq5uyfweZvjaA95MuhFGk1ZHnEDaNK7n/WvEZpgktAklzaJDj9zBb3AGpwvPt9cV5sF7EpHYIHidA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR04MB3751.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(110136005)(2906002)(478600001)(966005)(316002)(8936002)(7416002)(86362001)(7696005)(54906003)(55016002)(6506007)(26005)(53546011)(186003)(9686003)(4326008)(91956017)(52536014)(5660300002)(71200400001)(66446008)(66556008)(76116006)(83380400001)(64756008)(66476007)(33656002)(8676002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 HtMaE2BwN/2W+9t/NrtErkti35GJq6gGDKXO9xCNkUcxb05yzMtwN23rXZQ4BHC6DpwVV4oBWq6HmCCDBjhj5zpvv+AQGsGDhRb8TR4jdsA/LKRkX8thCQ29zAZ6TSZK2+jR6zDUI2GVFNohYk9PQut5HJWmlAhiiWwxHuvlE8k2EL486YF6IfzdljlSX9byHWGHnLJxjKN9+X08/G3GeLYNRqxZ3hsC2OgWFyEiQDLjvWxZ6qKq3+8zKgymocWLQQ9frsadqmIDErUiLJzXVrkfQagD3cIFZbyNDNsPn25jIK9M2h+2Nn59h70tIURrtLuyXzfAnJKEozWQqNEslMfhJxeCDsjRavHy4cygHk+mC7VacuXsTgl1Kk8ZfRbmcmV57UgAla4U0LdwFfO/XFj/IKjwoy/3h9AMffCrxNYYlP015+6hs9WFCVbTLboAETHGLKdwL1b74BOc3/pgWGcRmzLYus1X9dMSX7RYa7JNWAsf2NTubmAoqYj43E6F
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287fc062-1b11-4bc5-2e9c-08d82d664680
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 11:07:36.3116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRW+FR29c5wvw7W11DHcvX6bTa+g3mUFlZYT8AUu1ohFA3hkJ+BEC0uggYnHzR8Dk9Qf8MRcozJdJlcnpMialQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0422
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6SXwOcQaKbJ.A.QJF.1JtFfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/919
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CY4PR04MB375159E32C34FD487EB33C5CE7780@CY4PR04MB3751.namprd04.prod.outlook.com
Resent-Date: Tue, 21 Jul 2020 11:33:09 +0000 (UTC)

On 2020/07/21 19:54, Maxim Levitsky wrote:=0A=
> Linux kernel only supports logical block sizes which are power of two,=0A=
> at least 512 bytes and no more that PAGE_SIZE.=0A=
> =0A=
> Check this instead of crashing later on.=0A=
> =0A=
> Note that there is no need to check physical block size since it is=0A=
> only a hint, and virtio-blk already only supports power of two values.=0A=
> =0A=
> Bugzilla link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1664619=0A=
> =0A=
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>=0A=
> ---=0A=
>  drivers/block/virtio_blk.c | 15 +++++++++++++--=0A=
>  1 file changed, 13 insertions(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c=0A=
> index 980df853ee497..b5ee87cba00ed 100644=0A=
> --- a/drivers/block/virtio_blk.c=0A=
> +++ b/drivers/block/virtio_blk.c=0A=
> @@ -809,10 +809,18 @@ static int virtblk_probe(struct virtio_device *vdev=
)=0A=
>  	err =3D virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,=0A=
>  				   struct virtio_blk_config, blk_size,=0A=
>  				   &blk_size);=0A=
> -	if (!err)=0A=
> +	if (!err) {=0A=
> +		if (!blk_is_valid_logical_block_size(blk_size)) {=0A=
> +			dev_err(&vdev->dev,=0A=
> +				"%s failure: invalid logical block size %d\n",=0A=
> +				__func__, blk_size);=0A=
> +			err =3D -EINVAL;=0A=
> +			goto out_cleanup_queue;=0A=
> +		}=0A=
>  		blk_queue_logical_block_size(q, blk_size);=0A=
> -	else=0A=
> +	} else {=0A=
>  		blk_size =3D queue_logical_block_size(q);=0A=
> +	}=0A=
>  =0A=
>  	/* Use topology information if available */=0A=
>  	err =3D virtio_cread_feature(vdev, VIRTIO_BLK_F_TOPOLOGY,=0A=
> @@ -872,6 +880,9 @@ static int virtblk_probe(struct virtio_device *vdev)=
=0A=
>  	device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);=0A=
>  	return 0;=0A=
>  =0A=
> +out_cleanup_queue:=0A=
> +	blk_cleanup_queue(vblk->disk->queue);=0A=
> +	vblk->disk->queue =3D NULL;=0A=
>  out_free_tags:=0A=
>  	blk_mq_free_tag_set(&vblk->tag_set);=0A=
>  out_put_disk:=0A=
> =0A=
=0A=
Looks good to me.=0A=
=0A=
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

