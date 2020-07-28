Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F53230F09
	for <lists+nbd@lfdr.de>; Tue, 28 Jul 2020 18:17:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 45AA02041E; Tue, 28 Jul 2020 16:17:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 28 16:17:34 2020
Old-Return-Path: <stefanha@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	PGPSIGNATURE,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0A282203C6
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Jul 2020 16:17:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id s5niNjzcQyy9 for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Jul 2020 16:17:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 4D69E203E4
	for <nbd@other.debian.org>; Tue, 28 Jul 2020 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595953030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0umpA98IwRGx6/MPdjALwMgb7oXwSSsk+mQbCZoe0MU=;
	b=cy1DgBcIe9jCFimUexvmawG36dl3p5R9yoXcIgzWQcL419AxCyRzMIurJ3akPjCCkBXnDc
	K3BlH5atC6tp8AFeaIWIdbk/v1us7WTjEUDMqX9Pq935jo5uerw04ndPxlnyNPti+llYe7
	7PHT23FWrPvmdlDVdQ/oZBNVEQjoN00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-nZeArAQfM2eHGtGOwT-JDA-1; Tue, 28 Jul 2020 11:45:10 -0400
X-MC-Unique: nZeArAQfM2eHGtGOwT-JDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C96A2106B246;
	Tue, 28 Jul 2020 15:44:42 +0000 (UTC)
Received: from localhost (ovpn-115-19.ams2.redhat.com [10.36.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BFD6712E8;
	Tue, 28 Jul 2020 15:44:41 +0000 (UTC)
Date: Tue, 28 Jul 2020 16:44:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: linux-kernel@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	"open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>,
	"open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
	"open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
	Tejun Heo <tj@kernel.org>, Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Jason Wang <jasowang@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Colin Ian King <colin.king@canonical.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ajay Joshi <ajay.joshi@wdc.com>, Ming Lei <ming.lei@redhat.com>,
	"open list:SONY MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, Satya Tangirala <satyat@google.com>,
	"open list:NETWORK BLOCK DEVICE (NBD)" <nbd@other.debian.org>,
	Hou Tao <houtao1@huawei.com>, Jens Axboe <axboe@fb.com>,
	"open list:VIRTIO CORE AND NET DRIVERS" <virtualization@lists.linux-foundation.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Alex Dubov <oakad@yahoo.com>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
Message-ID: <20200728154440.GD21660@stefanha-x1.localdomain>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-3-mlevitsk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200721105239.8270-3-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YXBXh7FNvyL.A.31D.e-EIfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/927
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200728154440.GD21660@stefanha-x1.localdomain
Resent-Date: Tue, 28 Jul 2020 16:17:34 +0000 (UTC)

--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 01:52:31PM +0300, Maxim Levitsky wrote:
> Linux kernel only supports logical block sizes which are power of two,
> at least 512 bytes and no more that PAGE_SIZE.
>=20
> Check this instead of crashing later on.
>=20
> Note that there is no need to check physical block size since it is
> only a hint, and virtio-blk already only supports power of two values.
>=20
> Bugzilla link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1664619
>=20
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8gR+gACgkQnKSrs4Gr
c8jH9gf9EntnBlm/IA+XQjmYVE6AzhflC6xpD5M+QOMtx8Gej8rEDnfv7e+8O5qL
wr7XyrYfjofwgT61Li9+QV7z8mw4hKwMUGpqUDULEHY/X6u0yegtZJiBgwAViSHw
shlmEyXroq4nlwvLOveuIj85c/56JUHpAIAUh0zhj9ZYvhyoaf6mWs5C6jz6Pp1z
wVqPpFhPNq1slTBQM9usXil/ToMZvt5FlHhFeF2KaKruugDnF5NeYg4bvOYZohNp
1zFxVPsHL2QKJQ5mhGBNoyvu4Z3XxgT093CydyLsxOoS+fgPV9l0p5hsl53VELL0
wORoNRxEjSgis0Ixkvc7AK42GUfpow==
=aToL
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--

