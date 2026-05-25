Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKP7FSftE2pCHgcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 25 May 2026 08:33:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6115C67C1
	for <lists+nbd@lfdr.de>; Mon, 25 May 2026 08:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 01847207BC; Mon, 25 May 2026 06:33:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 25 06:33:09 2026
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 86F322070C
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 May 2026 06:15:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QagH-2DBUveG for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 May 2026 06:15:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 700 seconds by postgrey-1.36 at bendel; Mon, 25 May 2026 06:15:02 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4B67F206FB
	for <nbd@other.debian.org>; Mon, 25 May 2026 06:15:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B108368C4E; Mon, 25 May 2026 08:03:14 +0200 (CEST)
Date: Mon, 25 May 2026 08:03:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Jens Axboe <axboe@kernel.dk>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sung-woo Kim <iam@sung-woo.kim>, Josef Bacik <josef@toxicpanda.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>, Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Luke Wang <ziniu.wang_1@nxp.com>,
	Kees Cook <kees@kernel.org>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v1] block: switch numa_node to int in blk_mq_hw_ctx and
 init_request
Message-ID: <20260525060313.GA3586@lst.de>
References: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EYHNuPMiBcD.A.IMBG.l0-EqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3541
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260525060313.GA3586@lst.de
Resent-Date: Mon, 25 May 2026 06:33:10 +0000 (UTC)
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : No valid SPF, No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	R_SPF_NA(0.00)[no SPF record];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mateusz.nowicki@posteo.net,m:axboe@kernel.dk,m:csander@purestorage.com,m:iam@sung-woo.kim,m:josef@toxicpanda.com,m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:bmarzins@redhat.com,m:ulfh@kernel.org,m:richard@nod.at,m:chengzhihao1@huawei.com,m:miquel.raynal@bootlin.com,m:vigneshr@ti.com,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:kbusch@kernel.org,m:hch@lst.de,m:sagi@grimberg.me,m:justin.tee@broadcom.com,m:nareshgottumukkala83@gmail.com,m:paul.ely@broadcom.com,m:kch@nvidia.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:fourier.thomas@gmail.com,m:viro@zeniv.linux.org.uk,m:ziniu.wang_1@nxp.com,m:kees@kernel.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:dm-devel@lists.linux.dev,m:linux-mmc@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:fourie
 rthomas@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER(0.00)[hch@lst.de,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.dk,purestorage.com,sung-woo.kim,toxicpanda.com,redhat.com,kernel.org,nod.at,huawei.com,bootlin.com,ti.com,jannau.net,gompa.dev,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,HansenPartnership.com,oracle.com,zeniv.linux.org.uk,nxp.com,vger.kernel.org,other.debian.org,lists.linux.dev,lists.infradead.org];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.871];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:rdns,bendel.debian.org:helo,lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: EC6115C67C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

