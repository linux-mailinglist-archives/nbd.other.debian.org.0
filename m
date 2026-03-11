Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNbgKlMzsWm0rwIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 11 Mar 2026 10:18:11 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 88442260271
	for <lists+nbd@lfdr.de>; Wed, 11 Mar 2026 10:18:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 665FC2048A; Wed, 11 Mar 2026 09:18:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 11 09:18:11 2026
Old-Return-Path: <mlombard@arkamax.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=4.0 tests=KHOP_HELO_FCRDNS,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	RDNS_DYNAMIC autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0653D20467
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Mar 2026 09:02:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.345 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.236, RDNS_DYNAMIC=0.982]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Nj_5nofGnGAe for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Mar 2026 09:02:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D1F9520458
	for <nbd@other.debian.org>; Wed, 11 Mar 2026 09:02:24 +0000 (UTC)
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 7f0d0655 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 11 Mar 2026 10:02:21 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 10:02:21 +0100
Message-Id: <DGZTXRKSHBPC.2B318HF53ZRSN@arkamax.eu>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v7.0-rc1 kernel
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Maurizio Lombardi" <mlombard@arkamax.eu>, "Yi Zhang"
 <yi.zhang@redhat.com>, "Shinichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
X-Mailer: aerc 0.21.0
References: <aZ_-cH8euZLySxdD@shinmob>
 <CAHj4cs8mzSZez+n2qLu5931YAuQ4=RxNt6D6YJCsMEwGrm4UtA@mail.gmail.com>
 <DGZRYXTKC049.1I6QFQSMSD88H@arkamax.eu>
In-Reply-To: <DGZRYXTKC049.1I6QFQSMSD88H@arkamax.eu>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <l-Z_GF_maPI.A.yF5I.TNTspB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3517
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/DGZTXRKSHBPC.2B318HF53ZRSN@arkamax.eu
Resent-Date: Wed, 11 Mar 2026 09:18:11 +0000 (UTC)
X-Rspamd-Queue-Id: 88442260271
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.09 / 15.00];
	AUTH_NA(1.00)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,m:mlombard@arkamax.eu,m:yi.zhang@redhat.com,m:shinichiro.kawasaki@wdc.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[arkamax.eu];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER(0.00)[mlombard@arkamax.eu,bounce-nbd=lists@other.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mlombard@arkamax.eu,bounce-nbd=lists@other.debian.org];
	NEURAL_HAM(-0.00)[-0.899];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arkamax.eu:mid,bendel.debian.org:rdns,bendel.debian.org:helo]
X-Rspamd-Action: no action

On Wed Mar 11, 2026 at 8:29 AM CET, Maurizio Lombardi wrote:
> On Wed Mar 11, 2026 at 1:35 AM CET, Yi Zhang wrote:
>
> If nvmet_rdma_rw_ctx_init() fails, shouldn't it call
> nvmet_req_free_sgls() before returning an error?

Possible fix, not tested:

diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
index 2d6eb89f98af..79ae743bb405 100644
--- a/drivers/nvme/target/rdma.c
+++ b/drivers/nvme/target/rdma.c
@@ -892,7 +892,7 @@ static u16 nvmet_rdma_map_sgl_keyed(struct nvmet_rdma_r=
sp *rsp,

 	ret =3D nvmet_rdma_rw_ctx_init(rsp, addr, key, &sig_attrs);
 	if (unlikely(ret < 0))
-		goto error_out;
+		goto error_free_sgl;
 	rsp->n_rdma +=3D ret;

 	if (invalidate)
@@ -900,6 +900,8 @@ static u16 nvmet_rdma_map_sgl_keyed(struct nvmet_rdma_r=
sp *rsp,

 	return 0;

+error_free_sgl:
+	nvmet_req_free_sgls(&rsp->req);
 error_out:
 	rsp->req.transfer_len =3D 0;
 	return NVME_SC_INTERNAL;

Maurizio

