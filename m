Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9241A33F
	for <lists+nbd@lfdr.de>; Tue, 28 Sep 2021 00:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 879A520475; Mon, 27 Sep 2021 22:45:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 27 22:45:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY,TO_WAY_TOO_MANY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4442220525
	for <lists-other-nbd@bendel.debian.org>; Mon, 27 Sep 2021 22:28:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.969,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, TO_WAY_TOO_MANY=3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3bg2j2VqOt5Y for <lists-other-nbd@bendel.debian.org>;
	Mon, 27 Sep 2021 22:28:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7364120502
	for <nbd@other.debian.org>; Mon, 27 Sep 2021 22:28:49 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id n71so24910263iod.0
        for <nbd@other.debian.org>; Mon, 27 Sep 2021 15:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w9ezsQ1UkQZeC53NkFhy7B+1aNQW9TNDf1kl1c4M4R4=;
        b=Ah7jkIIctR0HcnVgB5sWbeUdZwsGT2EehBK4lb+q32xOVavNWfD82zKlDGRJA1B4PM
         /2U90/0SvcC9l1r+IDSlahEN/NC+QMNdf8OLk/ooOlydqwz6QGg8wDViFrkfEGikp/c3
         /Q8A/XGE1SZVGZ1hcLnLB6Er8MX1tmX3kUoUHTd8fZUIlpDxvC5pwUQYipgCc7oJVSI+
         rkiNvqR6Uh37Z5l+Gj9S3tYzBLrJ2DlUD27NmkKUe2vWKFh1TgA7VLVoziOPGtTGPqo8
         dcSrTDLSWV/lT8K2aextSKUoXJ59tNYXOpE1Usf4pH7xnmSPdZY6piFtoxoW38lIHPW7
         +BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w9ezsQ1UkQZeC53NkFhy7B+1aNQW9TNDf1kl1c4M4R4=;
        b=MqV782YaOOd1EqD0VspA/q69B86veWUM97GOcu1jJ16ul7KusrSDGNQTnIHccztrgo
         7/NW+/uEYBfeBYz/jA17+fUZRm1FCbXkgdu5kD/HZzEVjwXlP5rJozBKo0jIwSJn+BQq
         40a+ku1Dcgz6MdzLMozsHUSeYkoUFFDtlCIrdJIAsEE+vy2dHGYUoxzkGT1brc63Bthm
         hAriHjZYaTzEzovh5spHamoyRPVhsW/SDWDcHYTyWLTSUcfHpXLtysvCtdrC/ArHPMJF
         SeNpH/iPUV7Gj/zuBzcMahO6Q7AaEsAZaGtwPuIsp106UQuQpin9oDWcTQm+YkMmS2k/
         AXnw==
X-Gm-Message-State: AOAM531YJwTWivgoE9HcPkPf8yOr5dukXERXMcOBkSoV6XnSfkb34IFk
	wh268sQm/PRlpKbQQkMwiCL4Kg==
X-Google-Smtp-Source: ABdhPJztY3mK3ksoDQMf3OrQ8dUSONHNyLP4EfHo/dO6kIiAhPp9t/W2Pe9f9RD+PJfpbL6A6UQe4w==
X-Received: by 2002:a02:22cf:: with SMTP id o198mr1814887jao.37.1632781726231;
        Mon, 27 Sep 2021 15:28:46 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id e13sm9446741iod.36.2021.09.27.15.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 15:28:45 -0700 (PDT)
Subject: Re: [PATCH v4 5/6] loop: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>, martin.petersen@oracle.com,
 jejb@linux.ibm.com, kbusch@kernel.org, sagi@grimberg.me,
 adrian.hunter@intel.com, beanhuo@micron.com, ulf.hansson@linaro.org,
 avri.altman@wdc.com, swboyd@chromium.org, agk@redhat.com,
 snitzer@redhat.com, josef@toxicpanda.com
Cc: hch@infradead.org, hare@suse.de, bvanassche@acm.org, ming.lei@redhat.com,
 linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mmc@vger.kernel.org, dm-devel@redhat.com, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
References: <20210927215958.1062466-1-mcgrof@kernel.org>
 <20210927215958.1062466-6-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <1cd6103b-1251-cc22-93ad-da7f207147b4@kernel.dk>
Date: Mon, 27 Sep 2021 16:28:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210927215958.1062466-6-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0mVMoU4YeeM.A.S7H.1lkUhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1530
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1cd6103b-1251-cc22-93ad-da7f207147b4@kernel.dk
Resent-Date: Mon, 27 Sep 2021 22:45:09 +0000 (UTC)

On 9/27/21 3:59 PM, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.

Applied, thanks.

-- 
Jens Axboe

