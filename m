Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F17937B3D
	for <lists+nbd@lfdr.de>; Fri, 19 Jul 2024 18:48:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AF373210F4; Fri, 19 Jul 2024 16:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jul 19 16:48:11 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5682221089
	for <lists-other-nbd@bendel.debian.org>; Fri, 19 Jul 2024 16:30:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.8 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wUwWOiojYQZP for <lists-other-nbd@bendel.debian.org>;
	Fri, 19 Jul 2024 16:30:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R11" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 13D8221093
	for <nbd@other.debian.org>; Fri, 19 Jul 2024 16:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WQZsc0DDMz6CmLxj;
	Fri, 19 Jul 2024 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1721406625; x=1723998626; bh=uTj1dDIbvkn2K8NySqz23JRo
	QMkjt37rdd+rEFyZmMk=; b=WOlc9UHf/NxzVa93uahVYiSQo6sYV+Unjqq+gls+
	8J2wXsoRHIpd6ea1CIfQV/JYhXJ3HeKFpM1RQJnYCdKCaZXtVJffD6no+CwIxo7v
	Cu0vRFLM+GllQdc2XJ22LB8zGBo7NDQwD6odf/+GQnPL/RgJz1aph8MhA1AtBrPW
	bYZefFxG9t+XyU61FAYrHZNmt2JgJcp95muinhVXFrMM/V3Vcz6gg8BTKHoo5YUv
	lNktfr4BFV2CeRmDtZAibn4e12ItqQUwbpLsStaLjLFL9/2cEKMHWwadUwOWDWs6
	hCaH9hctxYE/XLlOGHgmNWvt78jzMgdKJnU92QfF4AcJcg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id owc7DVikXRYk; Fri, 19 Jul 2024 16:30:25 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WQZsX5gTFz6CmLxd;
	Fri, 19 Jul 2024 16:30:24 +0000 (UTC)
Message-ID: <3e41d19e-19d4-43c2-bdc0-e321c62aa2f0@acm.org>
Date: Fri, 19 Jul 2024 09:30:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH blktests v2] nbd/rc: check nbd-server port readiness in
 _start_nbd_server()
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-block@vger.kernel.org, nbd@other.debian.org
Cc: Yi Zhang <yi.zhang@redhat.com>
References: <20240719050726.265769-1-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240719050726.265769-1-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <M2EwSRr4RzJ.A.-o6K.LjpmmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3100
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3e41d19e-19d4-43c2-bdc0-e321c62aa2f0@acm.org
Resent-Date: Fri, 19 Jul 2024 16:48:11 +0000 (UTC)

On 7/18/24 10:07 PM, Shin'ichiro Kawasaki wrote:
> Recently, CKI project reported nbd/001 and nbd/002 failure with the
> error message "Socket failed: Connection refused". It is suspected nbd-
> server is not yet ready when nbd-client connects for the first time.
> 
> To avoid the failure, wait for the nbd-server start listening to the
> port at the end of _start_nbd_server(). For that purpose, use
> "nbd-client -l" command, which connects to the server and asks to list
> available exports.
> 
> Reported-by: Yi Zhang <yi.zhang@redhat.com>
> Link: https://github.com/osandov/blktests/issues/142
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
> Change from v1:
> * Reduced sleep time from 1 second to 0.1 second
> 
>   tests/nbd/rc | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/tests/nbd/rc b/tests/nbd/rc
> index e96dc61..e200ba6 100644
> --- a/tests/nbd/rc
> +++ b/tests/nbd/rc
> @@ -63,13 +63,24 @@ _wait_for_nbd_disconnect() {
>   }
>   
>   _start_nbd_server() {
> +	local i
> +
>   	truncate -s 10G "${TMPDIR}/export"
>   	cat > "${TMPDIR}/nbd.conf" << EOF
>   [generic]
> +allowlist=true
>   [export]
>   exportname=${TMPDIR}/export
>   EOF
>   	nbd-server -p "${TMPDIR}/nbd.pid" -C "${TMPDIR}/nbd.conf"
> +
> +	# Wait for nbd-server start listening the port
> +	for ((i = 0; i < 100; i++)); do
> +		if nbd-client -l localhost &> "$FULL"; then
> +			break
> +		fi
> +		sleep .1
> +	done
>   }
>   
>   _stop_nbd_server() {

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

