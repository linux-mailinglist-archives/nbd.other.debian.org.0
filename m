Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 252873F9F30
	for <lists+nbd@lfdr.de>; Fri, 27 Aug 2021 20:51:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D8A30207E1; Fri, 27 Aug 2021 18:51:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 27 18:51:08 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RDNS_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 38DB32080A
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Aug 2021 18:33:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id V1C0EtjXVa6H for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Aug 2021 18:33:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1D18220806
	for <nbd@other.debian.org>; Fri, 27 Aug 2021 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UgAMblA+47VmVeEhj3CWGn9zmJ4QFpkMvnKXqn8H+RQ=; b=lZCVwiClkSzKtXkgZImhvNhGJ/
	GY2KHc56J5JWK2SplL/wzWO/YqzXslQnjRszwBIRxwV8oReBdHkjsdHByX7UGFKSLdUktre+WA5ZD
	CKMSGHrVpYJCjxJjzthi+xCo3zJ4ePk5/My5eR/DBWeU5ojJb0O5x8m20Q1rhL45gSKvxkKQLeoI/
	Ta9TTswqjOXMCJqU/xXY5xexoApBj4QPFrnWbDJY2Bb7imBy0AvR905nsaF4ymaiw+VpZIHCftbkW
	J3wJQKawiw5Mn8Cq0D5cKAW1kX6lFHPKHJEAlWRGHsYFhxiWwq7Xzo1BkF3thw16nkTYmHD1Tszhr
	JRIwTYlA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJgeq-00Cxw6-V7; Fri, 27 Aug 2021 18:32:52 +0000
Date: Fri, 27 Aug 2021 11:32:52 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com, hare@suse.de, bvanassche@acm.org,
	ming.lei@redhat.com, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] nvme: add error handling support for add_disk()
Message-ID: <YSkv1GtmFgvQ81Up@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
 <20210823202930.137278-6-mcgrof@kernel.org>
 <YSSNIaYpUhrkvC+J@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSSNIaYpUhrkvC+J@infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Smn0K_i8amB.A.QKD.cQTKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1349
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSkv1GtmFgvQ81Up@bombadil.infradead.org
Resent-Date: Fri, 27 Aug 2021 18:51:08 +0000 (UTC)

On Tue, Aug 24, 2021 at 07:09:37AM +0100, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 01:29:25PM -0700, Luis Chamberlain wrote:
> > +	rc = device_add_disk(ctrl->device, ns->disk, nvme_ns_id_attr_groups);
> > +	if (rc)
> > +		goto out_cleanup_ns_from_list;
> > +
> 
> Nit: no real need for the rc variable here as we never use the actual
> value.

Alrighty.

> >  	if (!nvme_ns_head_multipath(ns->head))
> >  		nvme_add_ns_cdev(ns);
> >  
> > @@ -3785,6 +3789,10 @@ static void nvme_alloc_ns(struct nvme_ctrl *ctrl, unsigned nsid,
> >  
> >  	return;
> >  
> > + out_cleanup_ns_from_list:
> > +	down_write(&ctrl->namespaces_rwsem);
> > +	list_del_init(&ns->list);
> > +	up_write(&ctrl->namespaces_rwsem);
> 
> This also needs to do a nvme_put_ctrl.

Fixed.

  Luis

